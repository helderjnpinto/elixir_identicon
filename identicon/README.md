# Identicon
```
simetrical on the middle
                        |
--------------------------------------------- 300 px 
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
300pc|                  |                      |   
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
     |                  |                      |   
_____________________________________________________

String -> identicon generator -> identicon image
|
^

String
  |> Compute MD5 hash of string
  |> List of numbers based on the string
  |> Pick color
  |> Build grid of squares
  |> Convert grid into image
  |> Save image


#color
## using de hash 
### First 3 elements of list  -> Identicon.main("asdf")
[145, 46, 200, 3, 178, 206, 73, 228, 165, 65, 6, 141, 73, 90, 181, 112]

```


**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `identicon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/identicon](https://hexdocs.pm/identicon).

