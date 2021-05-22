defmodule GithubTrendingCrawler do
  @base_url "https://github.com"

  def crawl() do
    HTTPoison.get!("#{@base_url}/trending/").body
    |> GithubTrendingParser.parse
  end

  def crawl(language) when is_binary(language) do
    HTTPoison.get!("#{@base_url}/trending/#{language}").body
    |> GithubTrendingParser.parse
  end
end
