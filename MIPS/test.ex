defmodule Test do

  def test() do
    test(demo())
  end

  def test(prgm) do
    {code, data} = Program.load(prgm)
    out = Out.new()
    Emulator.run(code, data, out)
  end

  def demo() do
    {:prgm,
    [
      {:addi, 1, 0, 5},
      {:lw, 2, 0, :arg},
      {:add, 4, 2, 1},
      {:addi, 5, 0, 1},
      {:label, :loop},
      {:sub, 4, 4, 5},
      {:out, 4},
      {:bne, 4, 0, :loop},
      :halt
    ],
      [{:label, :arg},
       {:word, 12}]}
  end

end
