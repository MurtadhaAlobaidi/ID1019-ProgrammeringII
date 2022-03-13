defmodule Brot do

  # given the complex number c and the maximum number of iterations m
  # return the value i if |zi|>2
  # or 0 if it does not for any i < m
  def mandelbrot(c, m) do
    z0 = Cmplx.new(0, 0)
    i=0
    test(i, z0, c, m)
  end

  # if we have reached the maximum iteration, it returns zero
  def test(m, _z, _c, m), do: 0
   # if the absolute value of z is greater than 2, in which case it returns i
    def test(i, z, c, m) do
    a = Cmplx.abs(z)
    if a <= 2.0 do
      z1 = Cmplx.add(Cmplx.sqr(z), c)
      test(i + 1, z1, c, m)
    else
      i
    end
  end


end

# Test
# Brot.mandelbrot(Cmplx.new(0.8, 0), 30)      #return 3
# Brot.mandelbrot(Cmplx.new(0.5, 0), 30)      #return 5
# Brot.mandelbrot(Cmplx.new(0.3, 0), 30)      #return 12
# Brot.mandelbrot(Cmplx.new(0.27, 0), 30)     #return 20
# Brot.mandelbrot(Cmplx.new(0.26, 0), 30)     #return 0
# Brot.mandelbrot(Cmplx.new(0.255, 0), 30)    #return 0
