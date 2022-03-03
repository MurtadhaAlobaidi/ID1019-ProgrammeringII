defmodule Deriv do
  @type literal() :: {:num, number()} | {:var, atom()}

  @type expr() :: literal()
  | {:add, expr(), expr()}
  | {:mul, expr(), expr()}
  | {:div, expr(), expr()}
  | {:exp, expr(), literal()}
  | {:ln, expr()}

  #För att test koden
  #2X+4
  def test1() do
    e = {:add,
        {:mul, {:num, 2}, {:var, :x}},
        {:num, 4}}
    d = deriv(e, :x)
    c = calc(d, :x, 5)
    IO.write("experssion: #{pprint(e)}\n")
    IO.write("derivative: #{pprint(d)}\n")
    IO.write("simplied: #{pprint(simplify(d))}\n")
    IO.write("calculated: #{pprint(simplify(c))}\n")
    :ok
  end

    #För att test loden
  #x^4
  def test2() do
    e = {:add,
        {:exp, {:var, :x}, {:num, 2}},
        {:num, 4}}
    d = deriv(e, :x)
    c = calc(d, :x, 4)
    IO.write("experssion: #{pprint(e)}\n")
    IO.write("derivative: #{pprint(d)}\n")
    IO.write("simplied: #{pprint(simplify(d))}\n")
    IO.write("calculated: #{pprint(simplify(c))}\n")
    :ok
  end

    def test3() do
    e = {:ln,
        {:exp, {:var, :x}, {:num, 3}}}
    d = deriv(e, :x)
    IO.write("experssion: #{pprint(e)}\n")
    IO.write("derivative: #{pprint(d)}\n")
    IO.write("simplied: #{pprint(simplify(d))}\n")
    :ok
  end

  def test4() do
    e = {:div,
        {:mul, {:var, :x}, {:num, 5}}, {:mul, {:var, :x}, {:num, 8}}}
    d = deriv(e, :x)
    IO.write("experssion: #{pprint(e)}\n")
    IO.write("derivative: #{pprint(d)}\n")
    IO.write("simplied: #{pprint(simplify(d))}\n")
    :ok
  end



  def deriv({:num, _},_) do {:num, 0} end
  def deriv({:var, v}, v) do {:num, 1} end
  #General case
  def deriv({:var, _}, _) do {:num, 0} end

  #Addition
  def deriv({:add, e1, e2}, v) do
    {:add, deriv(e1,v), deriv(e2,v)}
  end

  #Multiplication
  def deriv({:mul, e1, e2}, v) do
    {:add,
     {:mul, deriv(e1, v), e2},
     {:mul, e1, deriv(e2, v)}}
  end

  #division
  def deriv({:div, e1, e2}, v) do
    { :div,
      deriv(e1, v),deriv(e2, v)}
  end

  #Exponentiation
  def deriv({:exp, e, {:num, n}}, v) do
    {:mul,
     {:mul, {:num, n}, {:exp, e, {:num, n-1}}},
     deriv(e,v)}
  end

  #Natural logartthm
  def deriv({:ln, e1}, v) do
    { :div,
      deriv(e1, v),
      e1}
  end



  def calc({:num, n}, _, _) do {:num, n} end
  def calc({:var, v}, v, n) do {:num, n} end
  def calc({:var, v}, _, _) do {:var, v} end
  def calc({:add, e1, e2}, v, n) do
    {:add, calc(e1, v, n), calc(e2, v, n)}
  end
  def calc({:mul, e1, e2}, v, n) do
    {:mul, calc(e1, v, n), calc(e2, v, n)}
  end
  def calc({:exp, e1, e2}, v, n) do
    {:exp, calc(e1, v, n), calc(e2, v, n)}
  end





#För att få rent text
  #add
  def simplify({:add, e1, e2}) do
    simplify_add(simplify(e1), simplify(e2))
  end
  #multiplikation
  def simplify({:mul, e1, e2}) do
    simplify_mul(simplify(e1), simplify(e2))
  end
  #division
  def simplify({:div, e1, e2}) do
    simplify_div(simplify(e1), simplify(e2))
  end
  #Exponentiation
  def simplify({:exp, e1, e2}) do
    simplify_exp(simplify(e1), simplify(e2))
  end




  def simplify(e) do e end

  def simplify_add({:num, 0}, e2) do e2 end
  def simplify_add(e1, {:num, 0}) do e1 end
  def simplify_add({:num, n1}, {:num, n2}) do {:num, n1+n2} end
  def simplify_add(e1, e2) do {:add, e1, e2} end

  def simplify_mul({:num, 0}, _) do {:num, 0} end
  def simplify_mul(_,{:num, 0}) do {:num, 0} end
  def simplify_mul({:num, 1}, e2) do e2 end
  def simplify_mul(e1,{:num, 1}) do e1 end
  def simplify_mul({:num, n1}, {:num, n2}) do {:num, n1*n2} end
  def simplify_mul(e1, e2) do {:mul, e1, e2} end

  def simplify_div(e,e) do {:num, 1} end
  def simplify_div(e1, e2) do {:div, e1, e2} end

  def simplify_exp(_, {:num, 0}) do {:num, 1} end
  def simplify_exp(e1, {:num, 1}) do e1 end
  def simplify_exp({:num, n1}, {:num, n2}) do {:num, :math.pow(n1,n2)} end
  def simplify_exp(e1, e2) do {:exp, e1, e2} end





  def pprint({:num, n}) do "#{n}" end
  def pprint({:var, v}) do "#{v}" end
  def pprint({:add, e1, e2}) do "(#{pprint(e1)} + #{pprint(e2)})" end
  def pprint({:mul, e1, e2}) do "#{pprint(e1)} * #{pprint(e2)}" end
  def pprint({:exp, e1, e2}) do "(#{pprint(e1)})^(#{pprint(e2)})" end
  def pprint({:ln, e1}) do  "ln(#{pprint(e1)})" end
  def pprint({:div, e1, e2}) do "(#{pprint(e1)} / #{pprint(e2)} )" end

end
#############################################################
