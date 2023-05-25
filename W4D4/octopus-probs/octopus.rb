fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octo(arr)
    longest_fish = ""
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if j > i && ele2.length > ele2.length
                longest_fish += ele2
            # else
            #     longest_fish = ""
            end
        end
    end
    longest_fish
end

p sluggish_octo(fish)

longer = Proc.new {}

def dom_octo(arr)
    return arr if arr.length <= 1
    
    mid = arr.length/2
    left = arr[0...mid]
    right = arr[mid..-1]
    
    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
    
      end
    
      private
      def self.merge(left, right, &prc)
        merged = []
    
        until left.empty? || right.empty?
          if prc.call(left, right) == -1
            merged << left.shift
          else
            merged << right.shift
          end
        end
          merged + left + right
    
      end
    end

end