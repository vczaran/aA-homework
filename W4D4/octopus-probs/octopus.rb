fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octo(arr)
    longest_fish = ""
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if j > i && ele2.length > ele2.length
                longest_fish = ele2
            end
        end
    end
    longest_fish
end

# p sluggish_octo(fish)

prc = Proc.new { |x, y| x.length <=> y.length }

def dom_octo(arr, prc)
    return arr if arr.length <= 1
    
    mid = arr.length/2
    left = arr[0...mid]
    right = arr[mid..-1]
    
    merge(dom_octo(left, prc), dom_octo(right, prc), prc)
    
end
    
def merge(left, right, prc)
    merged = []
    
    until left.empty? || right.empty?
        if prc.call(left, right) <= -1
            merged << left.shift
        else
            merged << right.shift
        end
    end
         merged + left + right
        return merged[0]
end

# p dom_octo(fish, prc)


def clever_octo(fish)
    longest_fish = fish[0]

    fish.each do |ele|
        if ele.length > longest_fish.length
            longest_fish = ele
        end
    end
    longest_fish

end

# p clever_octo(fish)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up"]


def slow_dance(dir, tiles)
    tiles.each_with_index { |ele, i| return i if ele == dir }
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2,
               "right-down" => 3, "down" => 4, "left-down" => 5,
                "left" => 6, "left-up" => 7 }

def fast_dance(dir, tiles)
    tiles[dir]
end

# p fast_dance("up", tiles_hash)
# p fast_dance("right-down", tiles_hash)