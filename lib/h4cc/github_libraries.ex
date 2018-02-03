defmodule H4cc.GithubLibraries do
  require Logger

  @moduledoc """
  Main module that works with Github. 
  
  Fetches README.md file from H4cc "awersome-elixir" repository. 
  """
  
  @github_url "https://api.github.com/repos/h4cc/awesome-elixir/readme" 
  @headers [{"Authorization", "token #{Application.get_env(:h4cc, :token)}"}]

  @doc """
    Returns Map with folder name as key and List with %H4cc.Lib{} as value.

      H4cc.GithubLibraries.fetch()
      %{"Folder" => [%H4cc.Lib{commited: "2017-09-26T22:44:20Z", desc: "Description 1", name: "Name 1", stars: 7, url: "https://github.com/someurl1", is_git: true},
      %{commited: "2017-11-08T18:47:06Z", desc: "Description 2", name: "Name 2", stars: 508, url: "https://github.com/someurl2", is_git: true},
      %{commited: "2017-05-30T11:04:19Z", desc: "Description 3", name: "Name 3", stars: 44, url: "https://github.com/someurl3, is_git: true}, ...], ...}
  """
  def fetch() do  
    Logger.info "Fetching README.md from #{@github_url}"
    @github_url
    |> HTTPoison.get(@headers, [timeout: 10_000, recv_timeout: 10_000])
    |> handle_response
    |> validate_file
    |> String.split("\n", trim: true)
    |> H4cc.Parser.parse_file()
    |> Enum.map(&spawn(H4cc.GithubLibraries, :get_save_data, [&1]))
  end

  def get_save_data({k, v}) do 
    Logger.info "Fetching libraries from folder: #{k}"
    v
    |> Enum.map(&take_info/1)#(&spawn(H4cc.GithubLibraries, :take_info, [&1]))
    |> H4cc.DB.save_lib
  end
  
  @doc """
    Compares the received SHA and calculated SHA of file.
  """
  def validate_file({:error, body}) do
    Logger.error "Error! Can't validate file!"
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
  """
  def get_url(url) do
    #Logger.info "Fetching info from #{url}"
    url
    |> String.replace_leading("https://github.com", "https://api.github.com/repos")
    |> String.trim_trailing("/")
    |> HTTPoison.get(@headers, [timeout: 10_000, recv_timeout: 10_000])
    |> handle_response
  end

  @doc """
    Takes H4cc.Lib like:
    %H4cc.Lib{desc: "Some description", name: "name", url: "https://github.com/user/repo", is_git: true, stars: nil, commited: nil}.
    Returns updated H4cc.lib with actual information about number of stars and date of last commit.
  """
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
        Logger.error "#{lib.url} is unavailable"
        lib
    end
  end

  defp handle_response({ :ok, %{status_code: 200, body: body, headers: headers}}) do
    # Logger.info "Successful response. Left: #{take_limit(headers)}"
    Poison.Parser.parse(body)
  end
  
  defp handle_response({ :ok, %{status_code: 301, body: body}}) do
    # Logger.warn "Redirection"
    body
    |> Poison.Parser.parse!()
    |> Map.get("url")
    |> HTTPoison.get(@headers)
    |> handle_response
  end

  defp handle_response({ _, %{status_code: status, body: body}}) do
    Logger.error "Error #{status} returned"
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
