defmodule H4cc.GithubLibraries do
  require Logger

  @moduledoc """
  Main module that works with Github. 
  
  Fetches README.md file from H4cc "awersome-elixir" repository. 
  """
  
  @github_url "https://api.github.com/repos/h4cc/awesome-elixir/readme" 
  @headers [{"Authorization", "token #{Application.get_env(:h4cc, :token)}"}]

  @doc """
    Returns Map with libraries and some addition information about them inside.

  ## Examples
      iex> H4cc.GithubLibraries.fetch()
      %{"Actors" => 
      [%{commited: "2017-09-26T22:44:20Z", desc: "Pipelined flow processing engine", name: "dflow", stars: 7, url: "https://github.com/dalmatinerdb/dflow"},
      %{commited: "2017-11-08T18:47:06Z", desc: "Helpers for easier implementation of actors in Elixir", name: "exactor", stars: 508, url: "https://github.com/sasa1977/exactor"},
      %{commited: "2017-05-30T11:04:19Z", desc: "A Port Wrapper which forwards cast and call to a linked Port", name: "exos", stars: 44, url: "https://github.com/awetzel/exos"}, ...] ...}
  """

  def fetch() do  
    Logger.info "Fetching README.md from #{@github_url}"
    HTTPoison.get(@github_url, @headers)
    |> handle_response
    |> validate_file
    |> String.split("\n", trim: true)
    |> H4cc.Parser.parse_file()
    |> Enum.map(&spawn(H4cc.GithubLibraries, :get_save_data, [&1]))
  end

  def get_save_data({k, v}) do 
    Logger.info "Fetching libraries from folder: #{k}"
    v
    |> Enum.map(&take_info/1)
    |> H4cc.DB.save_data
  end
  
  @doc """
    Compares the received SHA and calculated SHA of file.
  """
  def validate_file({:error, body}) do
    Logger.warn "Error!"
    IO.inspect body
  end

  def validate_file({:ok, body}) do
    file = 
    body
    |> Map.get("content")
    |> Base.decode64!(ignore: :whitespace)
    
    size = 
    body
    |> Map.get("size")
    |> Integer.to_string
    
    sha = 
    :crypto.hash(:sha, "blob "<>size<>"\0"<>file) 
    |> Base.encode16       
    |> String.downcase
    
    if sha == Map.get(body, "sha") do
      Logger.info "SHA equal #{sha}"
      file
    else
      Logger.warn "SHA not equal! #{sha} and #{Map.get(body, "sha")}"
    end  
  end

  @doc """
    Returns JSON information about ropository by it URL.
 
  ## Examples
      iex> H4cc.GithubLibraries.get_url("https://github.com/elixir-lang/ex_doc")
      %{"statuses_url" => "https://api.github.com/repos/elixir-lang/ex_doc/statuses/{sha}", 
      "watchers" => 522, "mirror_url" => nil, 
      "stargazers_count" => 522, 
      "license" => %{"key" => "other", "name" => "Other", "spdx_id" => nil, "url" => nil},
      "events_url" => "https://api.github.com/users/elixir-lang/events{/privacy}",
      "followers_url" => "https://api.github.com/users/elixir-lang/followers",
      "following_url" => "https://api.github.com/users/elixir-lang/following{/other_user}",
      "gists_url" => "https://api.github.com/users/elixir-lang/gists{/gist_id}", "gravatar_id" => "",
      "html_url" => "https://github.com/elixir-lang", "id" => 1481354, "login" => "elixir-lang",
      "organizations_url" => "https://api.github.com/users/elixir-lang/orgs",
      "repos_url" => "https://api.github.com/users/elixir-lang/repos", "site_admin" => false,
      "starred_url" => "https://api.github.com/users/elixir-lang/starred{/owner}{/repo}",
      "forks" => 118, "default_branch" => "master", 
      "comments_url" => "https://api.github.com/repos/elixir-lang/ex_doc/comments{/number}",
      "commits_url" => "https://api.github.com/repos/elixir-lang/ex_doc/commits{/sha}", "id" => 3642931,
      "homepage" => "http://elixir-lang.org", 
      "forks_count" => 118, "pushed_at" => "2018-01-19T15:37:31Z"}
  """
  def get_url(url) do
    #Logger.info "Fetching info from #{url}"
    url
    |> String.replace_leading("https://github.com", "https://api.github.com/repos")
    |> HTTPoison.get(@headers)
    |> handle_response
  end

  @doc """
    Takes H4cc.Lib like:
    %H4cc.Lib{desc: "Some description", name: "name", url: "https://github.com/user/repo", is_git: true, stars: nil, commited: nil}.
    Returns updeted H4cc.lib with actual information about number of stars and date of last commit.
  ## Examples
      iex> H4cc.GithubLibraries.take_info(%H4cc.Lib{desc: "Helpers for easier implementation of actors in Elixir", name: "exactor", url: "https://github.com/sasa1977/exactor"", is_git: true, stars: nil, commited: nil})
      %H4cc.Lib{commited: "2017-11-08T18:47:06Z", desc: "Helpers for easier implementation of actors in Elixir", name: "exactor", stars: 508, url: "https://github.com/sasa1977/exactor", is_git: true}
  """

  #def take_info(lib) do
  #  if lib.is_git do
  #    answ = get_url(lib.url)
  #    stars = Map.get(answ, "stargazers_count")
  #    date = Map.get(answ, "pushed_at")                 
  #    %{lib | stars: stars, commited: date}
  #  else
  #    Logger.warn "#{lib.url} is not a Github library"
  #    lib
  #  end
  #end

  def take_info(lib) do
    with true       <- lib.is_git,
         {:ok, ans} <- get_url(lib.url)
    do
      stars = Map.get(ans, "stargazers_count")
      date = Map.get(ans, "pushed_at")                 
      %{lib | stars: stars, commited: date}
    else
      false       ->
        Logger.warn "#{lib.url} is not a Github library"
        lib
      {:error, _} -> 
        Logger.warn "#{lib.url} is unavailable"
        lib
    end
  end

  defp handle_response({ :ok, %{status_code: 200, body: body, headers: headers}}) do
    # Logger.info "Successful response. Left: #{take_limit(headers)}"
    Poison.Parser.parse(body)
  end
  
  defp handle_response({ :ok, %{status_code: 301, body: body}}) do
    # Logger.warn "Redirection"
    Poison.Parser.parse!(body)
    |> Map.get("url")
    |> HTTPoison.get(@headers)
    |> handle_response
  end

  defp handle_response({ _, %{status_code: status, body: body}}) do
    Logger.error "Error #{status} returned"
    # IO.inspect body
    {:error, %{}}
  end
  
  defp handle_response({ :error, %{reason: reason}}) do
    Logger.error "Error: #{reason}"
    {:error, %{}}
  end

  defp take_limit(headers) do
    headers 
    |> Enum.into(%{})
    |> Map.get("X-RateLimit-Remaining")
  end
end
