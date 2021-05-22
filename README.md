# GithubTrendingCrawler

Crawl for GitHub Trending with Elixir.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `github_trending_crawler` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:github_trending_crawler, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
# Normal
GithubTrendingCrawler.crawl()

# Specify the language
GithubTrendingCrawler.crawl("python")
```
