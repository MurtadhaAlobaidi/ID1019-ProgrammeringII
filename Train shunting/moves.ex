defmodule Moves do
    import ListP
    @type wagon() :: {:var, atom()}

    @type track() :: {:main, atom()} | {:one, atom()} | {:two, atom()}

    @type train() :: [] | [wagon(), ...]

    @type move() :: {track(), {:num, number()}}

    @type state() :: {[train()], [train()], [train()]} 


    
    # # No wagons are moved at all
    # def single({:one, 0}, input_state) do input_state end
    # def single({:two, 0}, input_state) do input_state end



    # # n will always be positive when we call this function clause...
    # # main is full, one is empty, two is empty or both one and two are empty
    # def single({:one, n}, {[h1|t1], [], []}) do
    #     {take([h1|t1],length([h1|t1])-n), append(drop([h1|t1], length([h1|t1])-n),[]), []}
    # end
    # def single({:two, n}, {[h1|t1], [], []}) do
    #     {take([h1|t1],length([h1|t1])-n), [], append(drop([h1|t1], length([h1|t1])-n),[])}
    # end
    # def single({:one, n}, {[h1|t1], [], [h3|t3]}) do
    #     {take([h1|t1],length([h1|t1])-n), append(drop([h1|t1], length([h1|t1])-n),[]), [h3|t3]}
    # end
    # def single({:two, n}, {[h1|t1], [h2|t2], []}) do
    #     {take([h1|t1],length([h1|t1])-n), [h2|t2], append(drop([h1|t1], length([h1|t1])-n), [])}
    # end


    # # n will always be negative when we call this function clause...
    # # main is empty, both one and two are full
    # def single({:one, n}, {[], [h2|t2], [h3|t3]}) do
    #     {take([h2|t2], n*(-1)), drop([h2|t2], n*(-1)), [h3|t3]}
    # end
    # def single({:two, n}, {[], [h2|t2], [h3|t3]}) do
    #     {take([h3|t3], n*(-1)), [h2|t2], drop([h3|t3],n*(-1))}
    # end





    # # n will always be negative when we call this function clause...
    # # main is empty, either one or two is empty
    # def single({:one, n}, {[], [h2|t2], []}) do
    #     {take([h2|t2], n*(-1)), drop([h2|t2], n*(-1)), []}
    # end
    # def single({:two, n}, {[], [], [h3|t3]}) do
    #     {take([h3|t3], n*(-1)), [], drop([h3|t3],n*(-1))}
    # end
    # def single({:two, n}, {main, one, two}) do
    #     case n do
    #         n when n>0 -> 
                
    #     end
    # end






    # # n can either be positive or negative
    # # all of the traks contains some wagons, all of them are full
    # def single({:one, n}, {[h1|t1], [h2|t2], [h3|t3]}) do
    #     if (n > 0) do 
    #     {
    #         take([h1|t1],length([h1|t1])-n),
    #         append(drop([h1|t1], length([h1|t1])-n), [h2|t2]),
    #         [h3|t3]
    #     }
    #     else 
    #     {
    #         append([h1|t1], take([h2|t2], n*(-1))),
    #         drop([h2|t2],n*(-1)),
    #         [h3|t3]
    #     } 
    #     end
    # end

    # def single({:two, n}, {[h1|t1], [h2|t2], [h3|t3]}) do
    #     if (n > 0) do 
    #     {
    #         take([h1|t1],length([h1|t1])-n),
    #         [h2|t2],
    #         append(drop([h1|t1], length([h1|t1])-n), [h3|t3])
    #     }
    #     else 
    #     {
    #         append([h1|t1],take([h3|t3],n*(-1))),
    #         [h2|t2],
    #         drop([h3|t3],n*(-1))
    #     } 
    #     end
    # end


    def single({:one, n}, {main, one, two}) do
        
        if (n>0) do {take(main, length(main)-n), 
                append(drop(main, length(main)-n), one), two};
        else if ( n<0) do {append(main, take(one, n*-1)), 
                drop(one,n*-1), two};
        else if (n==0) do {main, one, two} end
        
        # case N do
        #     N when N>0  ->
        #         {take(Main, length(Main)-N), 
        #         append(drop(Main, length(Main)-N), One), Two};
        #     N when N<0 ->
        #         {append(Main, take(One, N*-1)), 
        #         drop(One,N*-1), Two};
        #     0 ->
        #         {Main, One, Two}
        # end
        end
        end
    end
    def single({:two, n}, {main, one, two}) do
        case n do
            n when n>0  ->
                {take(main, length(main)-n), 
                one, append(drop(main, length(main)-n), two)};
            n when n<0 ->
                {append(main, take(two, n*-1)), 
                one, drop(two, n*-1)};
            n when n==0 ->
                {main, one, two}
        end
    end

    def move(list, initState) do
            [initState | 
                        case list do
                            [] -> list
                            _ -> move(tl(list), single(hd(list), initState))
                        end
            ]
    end


end


#wagons = {[:a,:b,:c,:d,:e,:f],[],[]}
# wagons_one = {[:a,:b,:c,:d],[:e,:f],[]}
# wagons_two = {[:a,:b,:c,:d],[],[:e,:f]}

# Moves.single({:one, 0}, wagons) # returns {[:a, :b, :c, :d, :e, :f], [], []}
# Moves.single({:one, 1}, wagons) # returns {[:a], [:b, :c, :d, :e, :f], []}
# Moves.single({:one, -1}, wagons_one) # returns {[:e, :a, :b, :c, :d], [:f], []}

# Moves.single({:two, 0}, wagons) # returns {[:a, :b, :c, :d, :e, :f], [], []}
# Moves.single({:two, 1}, wagons) # returns {[:b, :c, :d, :e, :f], [], [:a]}
# Moves.single({:two, -1}, wagons_two) # returns {[:e, :a, :b, :c, :d], [], [:f]}

# Moves.move([], wagons) # returns {[:a, :b, :c, :d, :e, :f], [], []}
# Moves.move([{:one, 1},{:two, 1}], wagons) # returns {[], [:b, :c, :d, :e, :f], [:a]}
# Moves.move([{:one, 1},{:two, 1}, {:one, -2}, {:two,-1},{:two,1}], wagons) # returns {[:b, :c], [:d, :e, :f], [:a]}
#move([{:one,1},            {:two,1},       {:one,-1}],        {[:a,:b],[],[]})
#returns[{[:a,:b],[],[]},  {[:a],[:b],[]},   {[],[:b],[:a]},   {[:b],[],[:a]}]