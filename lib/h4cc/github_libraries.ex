defmodule H4cc.GithubLibraries do
  require Logger

  @github_url "https://api.github.com/repos/h4cc/awesome-elixir/readme" 
  @user_agent [ {"User-agent", "Elixir dave@pragprog.com"} ]

  #def fetch() do
  #  Logger.info "Fetching libraries from #{@github_url}"
  #  HTTPoison.get(@github_url, @user_agent)
  #  |> handle_response
  #  |> Floki.find("a")
  #  |> Floki.text(sep: "\r\n")
  #  |> String.split("\r\n", trim: true)
  #end
  
  def fetch() do
    Logger.info "Fetching README.md from #{@github_url}"
    HTTPoison.get(@github_url, @user_agent)
    |> handle_response
    |> Map.get("content")
    |> Base.decode64!(ignore: :whitespace)
    |> String.split("\n", trim: true)
    |> H4cc.Parser.parsefile()
   # |> TableRex.quick_render!()
   # |> IO.puts
  end

  def handle_response({ :ok, %{status_code: 200, body: body}}) do
    Logger.info "Successful response"
    Poison.Parser.parse!(body)
  end

  def handle_response({ _, %{status_code: status, body: body}}) do
    Logger.error "Error #{status} returned"
    body
  end
end
