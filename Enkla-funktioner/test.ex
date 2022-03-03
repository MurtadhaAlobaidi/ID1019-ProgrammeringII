defmodule Test do

#A first program
#I defined argument (n) and then returns the double of that argument by (*2).
# def double(n) do
#   n*2
# end
# #######################
# #a function that converts from Fahrenheit to Celsius
# def celsius(fahrenheit) do
#   (fahrenheit - 32) / 1.8
# end
# #######################
# #a function that calculates the area of a rectangle give the length of the two sides
# def rectangle_area(sid1,sid2) do
#   sid1 * sid2
# end
#######################
#a function that calculates the area of a square, using the previous functiondef rectangle_area(sid1,sid2) do
# def square_area(a) do
#   rectangle_area(a,a)
# end
# #######################
# #a function that calculates the area of a square, using the previous functiondef rectangle_area(sid1,sid2) do
# def circle_area(r) do
#   r*r*3.14
# end
#################################################################################################################################
#3 Recursive definitions

# # The product of m and n is: 0 if m is equal to 0, otherwise the product is n plus the product of m−1 and n.
# # Once you have written down the definition, the coding is simple.
# def product(m, n) do
#   if m == 0 do
#     product=0
#   else
#     n + product(m-1 , n)
#   end
# end
#############################################################
# There are alternative ways of writing this, we could use a case expression or the cond-do expression.
# These techniques are often preferred over if-else in Elixir.
# def product_case(m, n) do
#   case m do
#   0 -> m
#   _ -> product_case(m-1 , n) + n
#   end
# end

# def product_cond(m, n) do
#   cond do
#   m == 0 -> 0
#   true -> product_cond(m-1 , n) + n
#   end
# end
#############################################################
#This should be read: if we call product, and the first argument matches 0, then the result is 0.
#if we call product, and the second argument matches 0, then the result is 0.
#if we can not use the first and second clause then we try the the third
# def product_clauses(0, _) do 0 end
# def product_clauses(m, n) do
#   product_clauses(m-1, n) + n
# end
#############################################################
#Define a function, exp/2, that computes the exponentiation, x^n.
#case one if n=0 give us 1
#x raised to 1 is x
# def exp(x, n) do
#     case n do
#       0 -> 1
#        _ -> product_clauses(x, exp(x, n-1))
#     end
# end
#############################################################
#x raised to n, if n is even, is x raised to n/2 multiplied by itself
#x raised to n, if n is odd, is x raised to (n−1) multiplied by x
def exponentiation(x, n) do
  case n do
    0 -> 1
    _ -> case rem(n,2) do
       0 -> exponentiation(x,div(n,2)) * exponentiation(x,div(n,2))
       1 -> x * exponentiation(x, n-1)
    end
  end
end
#Test.exponentiation(2,3)
##################################################################################################################################
#4.1 Simple functions on list
#nth(n, l): return the n’th element of the list l
def nth(n,l) do
  case n do
  1 -> hd(l)
  _ -> nth(n-1, tl(l))
      end
  end
#Test.nth(2,[1,50,3])
##########################################################################################
#len(l): return the number of elements in the list l
def len(l) do
  case l do
  [] -> 0
  _ -> 1 + len(tl(l))
      end
  end
#Test.len([2,3])
##########################################################################################
#sum(l): return the sum of all elements in the list l, assume that all elements are integers
  def sum(l) do
  case l do
  [] -> 0
  _ -> hd(l) + sum(tl(l))
      end
  end
# Test.sum([2,3])
##########################################################################################
#duplicate(l): return a list where all elements are duplicated
def dublicate(l) do
  case l do
    [] -> 1
    _ -> [hd(l) | [hd(l) | []]] ++ dublicate(tl(l))
  end
end
#Test.dublicate([1,5,4])
##########################################################################################
#add(x, l): add the element x to the list l if it is not in the list


##########################################################################################
#remove(x, l): remove all occurrences of x in l


##########################################################################################
#unique(l): return a list of unique elements in the list l,


##########################################################################################
#reverse(l): return a list where the order of elements is reversed
def reverse(input, acc \\ [])
def reverse([], acc), do: acc
def reverse([head | tail], acc) do
  reverse(tail, [head | acc])
end
##########################################################################################
































end
