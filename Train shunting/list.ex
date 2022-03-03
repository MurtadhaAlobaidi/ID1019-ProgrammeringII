defmodule ListP do

    def take(xs,n) do
        case xs do
            [] -> xs
            _ -> case n do
                0 -> []
                _ -> [hd(xs)|take(tl(xs),n-1)]    
            end  
        end
    end

    def drop(xs,n) do
        case xs do
            [] -> xs
            _ -> case n do
                0 -> xs
                _ -> drop(tl(xs), n-1)
                end 
        end
    end

    def append(xs,ys) do
        xs ++ ys
    end

    def member(xs,y) do
        case xs do
            [] -> false
            _ -> if (hd(xs) == y) do true
                else member(tl(xs),y) end
        end       
    end

    def position(xs,y) do
        case xs do
            [] -> 0
            _ -> if (hd(xs) == y) do 1
                else 1 + position(tl(xs),y) end
        end
    end

end