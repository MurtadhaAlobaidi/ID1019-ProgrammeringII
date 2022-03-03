import ListP
import Moves
defmodule Shunt do

    def find(xs, ys) do
        case ys do
            [] -> []
            _ -> {hs, ts} = split(xs, hd(ys))
			{[_|newXs],_,_} = single({:two, -(length(hs))},
			single({:one, -(length(ts)+1)}, 
			single({:two, length(hs)},
			single({:one, length(ts)+1}, {xs, [], []}))))

            [{:one, length(ts)+1}, {:two, length(hs)},
			{:one, -(length(ts)+1)}, {:two, -(length(hs))} | find(newXs, tl(ys))]
        end
    end

    def split(xs, y) do
        {take(xs, (position(xs,y)-1)), drop(xs, position(xs,y))}
    end

    def few(xs, ys) do
        case ys do
            [] -> []
            [y|t] ->[a|b] = xs
                    case y do
                        y when y==a -> few(b,t);
                        y when y != a ->
                            {hs, ts} = split(xs, y)
                            {[_|newXs],_,_} = single({:two, -(length(hs))},
                            single({:one, -(length(ts)+1)}, single({:two, length(hs)},
                            single({:one, length(ts)+1}, {xs, [], []}))))
            
                            [{:one, length(ts)+1}, {:two, length(hs)},
                            {:one, -(length(ts)+1)}, {:two, -(length(hs))} | few(newXs, t)]
                    end
        end
    end

    def compress(ms) do
        ns = rules(ms)
        if (ns == ms) do ms 
        compress(ns) 
        end
    end
    
    def rules(moveList) do
        case moveList do
            [] -> []
            [{_,n}] ->
                case n==0 do
                    true -> []
                    false -> moveList
                end
            [{a,n},{b,m}|t] ->
                case n==0 do
                    true -> [{b,m}|rules(t)]
                    false ->
                    case a==b do
                        true -> rules([{a,(n+m)}|t])
                        false -> [{a,n}|rules([{b,m}|t])]
                    end
                end
        end
    end

end