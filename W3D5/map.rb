class Map

   def initialize
     @map = []
   end

   def set(key, value)
      @map << [key, value] unless @map.include?(key)
   end


   def get(key)
     @map.each do |pair|
       return pair[1] if pair[0] == key
     end
   end

   def delete(key)
     @map.reject { |pair| pair[0] == key }
   end


   def show
     return @map
   end


end