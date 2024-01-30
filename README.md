# OmniChrono

OmniOutliner had a nice way of displaying durations: "2w" for two weeks, "5h" for five hours.
I haven't used OmniOutliner in many years, but I often use that format for durations when I
write markdown files or spreadsheets.

However, when I was parsing those files with Elixir, I didn't have an easy way to parse and
sum those duration strings. That is what this library helps with.

It allows you to parse a duration in this form, allows you to add or subtract durations
together, and allows you to parse strings containing duration arithmetic (e.g. "2w + 1w").

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `omni_chrono` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:omni_chrono, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/omni_chrono>.

