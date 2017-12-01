defmodule Identicon do
  @moduledoc """
        Documentation for Identicon.
  """

  def main(input) do
    input
    |> hash_string
    |> pick_color
    |> buid_grid
    |> filter_odd_squares
    |> build_pixel_map
  end

  def hash_string(input) do
    hex = :crypto.hash(:md5, input)
          |> :binary.bin_to_list
    %Identicon.Image{ hex: hex }
  end

  # def pick_color(image) do
  #   %Identicon.Image{hex: [r, g, b | _tail ] } = image
  #   %Identicon.Image{image | color: {r, g, b}}
  # end
  
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail ]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def buid_grid(%Identicon.Image{hex: hex} = image) do
   grid = 
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_rows/1)
      |> List.flatten
      |> Enum.with_index
    %Identicon.Image{image | grid: grid }
  end


  @doc """
  Mirror row
  
  # [145, 46, 200 ] ->  [ 145, 46, 200, 46, 145 ] 

  Example 
    iex> Identicon.mirror_rows([1,2,3])
    [1, 2, 3, 2, 1]
  """
  def mirror_rows(row) do
    [first, second | _tail ] = row
    row ++ [ second, first ]
  end


  def filter_odd_squares(%Identicon.Image{grid: grid } = image) do
    grid = Enum.filter grid, fn({code, _index }) ->  
      rem(code, 2) == 0
    end
    %Identicon.Image{ image | grid: grid}
  end


  def build_pixel_map(%Identicon.Image{grid: grid } = image) do
     pixel_map =
        Enum.map grid, fn({_code, index}) -> 
          horizontal = rem(index, 5) * 50
          vertical = div(index, 5) * 50

          top_left = {horizontal, vertical}
          bottom_right = {horizontal, vertical}
          {top_left, bottom_right}
        end
    %Identicon.Image{ image | pixel_map: pixel_map}
  end

end
