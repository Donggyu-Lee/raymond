defmodule Filterin do
  @moduledoc """
  Documentation for `Filterin`.
  """

  def getInside(str, head, _tail) do
    case String.split(str, head, parts: 2) do
      [remain, content] -> [remain, content]
      [content] -> ["", content]

    end
  end

  def getOutside(str, _head, tail) do
    case String.split(str, tail, parts: 2) do
      [content, remain] -> [content, remain]
      [_content] -> ["", ""]
    end
  end

  def filterIn("", _head, _tail) do
    ""
  end

  def filterIn(str, head, tail) do
    [_remain, content] = getInside(str, head, tail)
    [content, remain] = getOutside(content, head, tail)
    content <> filterIn(remain, head, tail)
  end

  def openParenCheck(str) do
    String.split(str, "(")
    |>Enum.count()
  end

  def closeParenCheck(str) do
    String.split(str, ")")
    |>Enum.count()
  end

  def parenCheck(str) do
    openParenCheck(str)-closeParenCheck(str)
  end


  def test(input) do
    case parenCheck(input) do
      0 -> case filterIn(input, "(", ")") do
        "" -> IO.puts "Empty String"
        contents -> IO.puts contents
      end
      _ -> IO.puts "Invalid Parentheses"
    end
  end


end
