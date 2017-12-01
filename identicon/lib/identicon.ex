defmodule Identicon do
  @moduledoc """
        Documentation for Identicon.
  """

  def main(input) do
    input
    |> hash_string
  end

  def hash_string(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end

end
