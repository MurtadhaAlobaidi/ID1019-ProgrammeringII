defmodule Test do
  ######################################## method 1 ######################################################################
  #Method 1
  #Vi ta liste av nummer från 2 till limit nummer
    def all_number(limit) do
        Enum.to_list(2..limit)
    end

    # ricuseive vi rubbar upp {\tt all_number()/1} och med hjälp av {\tt filter()/1}. Vi börjar proceccen för att hitta {\tt prime_list}
    def get_prime_list(limit) do
      filter(all_number(limit))
    end

#Vi börjar med att kolla om {\tt prime\_list} är tom då skickar vi en {\tt prime\_list}.
#Om den är inte tom du kolla på den första elements from {\tt prime_list}.
#Med hjälp av funcktionen{\tt helpfun()/2} funktionen skicker ricuseive till {filter()/1}.
    def filter(prime_list) do
        case prime_list do
            [] -> prime_list
            _ -> [hd(prime_list)] ++
              filter(helpfun(hd(prime_list), tl(prime_list)))
        end
    end
#{\tt helpfun()/2} gör att kollar på den första element from {\tt prime_list}.
#We start with the function that take the first element "e" from the “limit” list wich is element(2) in this case.
#Then with {\tt rem()/2} we removes all numbers in the list that that number is a factor of.
# Then we do same procces with the second elemens from {\tt limit} list.
    def helpfun(e, prime_list) do
        case prime_list do
            [] -> prime_list
            _ -> if (rem(hd(prime_list), e) == 0) do
              helpfun(e, tl(prime_list)) #gå till nästa element
              #Om rem !==0
            else [hd(prime_list)] ++ helpfun(e, tl(prime_list)) end
        end
    end


  ############################################# method 2 #################################################################################
  #method 2
  def all_number2(limit2) do
    Enum.to_list(2..limit2)
  end
#"list2" har alla nummer from 2 to limit och "plist2" har alla prim tal
  def filter2(list2, plist2) do
    case list2 do
        [] -> list2
        _-> if (check2(hd(list2), plist2)) do
              [hd(list2) | filter2(tl(list2), helpfun2(hd(list2), plist2))]
            else
                filter2(tl(list2), plist2)
            end
    end
  end

  def helpfun2(h, list2) do
    [h] ++ list2
  end
#Den kollar om "h" första element
  def check2(h, plist2) do
    case plist2 do
        [] -> true
        _ -> case rem(h, hd(plist2)) do
                0 -> false
                _ -> check2(h, tl(plist2))
             end
    end
  end


  def get_prime_list2(limit2) do
    filter2(all_number2(limit2), [])
  end

############################################## method 3 #################################################################################
#alla primtal från största till minst
#Method 3
 def all_number3(limit3) do
  Enum.to_list(2..limit3)
end

def filter3(list3, plist3) do
  case list3 do
      [] -> list3
      _-> if (check3(hd(list3), plist3)) do
            filter3(tl(list3), helpfun3(hd(list3), plist3)) ++  [hd(list3)]
          else
              filter3(tl(list3), plist3)
          end
  end
end

def helpfun3(h, list3) do
  [h] ++ list3
end

def check3(h, plist3) do
  case plist3 do
      [] -> true
      _ -> case rem(h, hd(plist3)) do
              0 -> false
              _ -> check3(h, tl(plist3))
           end
  end
end

def get_primes3(limit3) do
  filter3(all_number3(limit3), [])
end

################################## Timmer ##############################################################################
      def test(list) do
        case list do
            [] -> list
            _ -> [elem({time, your_func_result} = :timer.tc(&get_prime_list/1, [hd(list)]), 0)] ++ test(tl(list))
        end
      end



      def test2(list2) do
        case list2 do
            [] -> list2
            _ -> [elem({time, your_func_result} = :timer.tc(&get_prime_list2/1, [hd(list2)]), 0)] ++ test2(tl(list2))
        end
      end


      def test3(list3) do
        case list3 do
            [] -> list3
            _ -> [elem({time, your_func_result} = :timer.tc(&get_primes3/1, [hd(list3)]), 0)] ++ test3(tl(list3))
        end
      end
##################### Test ####################################################################################################
    #Method 1
    # Test.test([100, 250, 500, 1000, 1500])
    #Method 2
    # Test.test2([100, 250, 500, 1000, 1500])
    #Method 3
    # Test.test3([100, 250, 500, 1000, 1500])

  end
