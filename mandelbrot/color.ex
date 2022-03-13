defmodule Color do

  # Convert a scalar, from 0 to max, to a suitabe color
  # represented as {:rgb, r ,g ,b} where each element is
  # 0..255. This is just one way of doing it, there are
  # more advanced ways of doing this so do experiment.
  def convert(depth, max) do
    red(depth, max)
  end

  def red(depth, max) do
    func = depth / max

    # a is [0 - 4.0]
    a = func * 4

    # x is [0,1,2,3,4]
    x = trunc(a)

    # y is [0 - 255]
    y = trunc(255 * (a - x))

    case x do
      0 ->
        # black -> red
        #{:rgb, y, 0, 0}
        {:rgb, 0, 0, y}

      1 ->
        # red -> yellow
        #{:rgb, 255, y, 0}
        {:rgb, y, 255, 0}

      2 ->
        # yellow -> green
        #{:rgb, 255 - y, 255, 0}
        {:rgb, 255, 255 - y, 0}

      3 ->
        # green -> cyan
        #{:rgb, 0, 255, y}
        {:rgb, 0, 255, y}

      4 ->
        # cyan -> blue
        #{:rgb, 0, 255 - y, 255}
        {:rgb, 0, 255, 255 - y}
    end
  end
end
