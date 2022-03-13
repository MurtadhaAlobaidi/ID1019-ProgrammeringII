defmodule Cmplx do

  #returns the complex number with real value "r" and imaginary "i"
  def new(r, i) do
    {:complex,r, i}
  end

  #adds two complex numbers
  # To add a complex number, just treat i as a constant and perform normal algebra.
  # Graphically this is the same as vector addition.
  def add(a={:complex,r1, i1},b={:complex,r2, i2}) do
    {:complex, r1 + r2, i1 + i2}
  end

  # squares a complex number
  # To square a number again we just perform normal algebra.
  # i squared is equal to -1
  # Squaring a number has a very interesting graphical representation.
  # The angle from the real axis is always doubled.
  # In this way, squaring a number causes a rotation around the complex plane.
  # The important thing to realize here, is that they are two-dimensional.
  # They can be added, multiplied and squared just like normal numbers.
  def sqr(a={:complex,r, i}) do
    {:complex, r * r - i * i, 2 * r * i}
  end

  #the absolute value of a
  def abs(a={:complex,r, i}) do
    :math.sqrt(r * r + i * i)
  end
end
