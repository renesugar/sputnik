defmodule SputnikTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest Sputnik

  describe "Sputnik.start/2" do
    setup do
      {
        :ok,
        url: "https://httpbin.org/links/5/0",
        queries: ["a"]
      }
    end

    test "", state do
      result = capture_io(fn -> Sputnik.start(state[:url], state[:queries]) end)
      assert String.match?(result, ~r/Pages found: 5/)
    end
  end
end
