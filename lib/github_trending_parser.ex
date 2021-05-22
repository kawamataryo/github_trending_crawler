defmodule GithubTrendingParser do

  def parse(document) when is_binary(document) do
    document
    |> Floki.parse_document!
    |> parse_rows
    |> Enum.map(
      &(%{
        title: parse_title(&1),
        description: parse_description(&1),
        lanugage: parse_language(&1),
        link: parse_link(&1),
        star_count: parse_star_count(&1)
      })
    )
  end

  defp parse_rows(document) do
    document
    |> Floki.find(".Box-row")
  end

  defp parse_link(document) do
    document
    |> Floki.find("h1 > a")
    |> Enum.at(0)
    |> (&("#{@base_url}#{Floki.attribute(&1, "href")}")).()
  end

  defp parse_title(document) do
    document
    |> Floki.find("h1 > a")
    |> Enum.at(0)
    |> Floki.text
    |> remove_whitespace
  end

  defp parse_star_count(document) do
    document
    |> Floki.find("div.color-text-secondary > a:nth-child(2)")
    |> Enum.at(0)
    |> Floki.text
    |> remove_whitespace
    |> String.replace(",", "")
    |> String.to_integer
  end

  defp parse_description(document) do
    document
    |> Floki.find("p")
    |> Enum.at(0)
    |> Floki.text
    |> String.trim
  end

  defp parse_language(document) do
    document
    |> Floki.find("[itemprop='programmingLanguage']")
    |> Enum.at(0)
    |> Floki.text
  end

  defp remove_whitespace(text) do
    Regex.replace(~r/\s+/, text, "")
  end
end

