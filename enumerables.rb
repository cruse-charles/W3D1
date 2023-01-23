class Array
    def my_each(&prc)
#comment
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end



    def my_select(&prc)
        new_arr = []
        self.my_each do |el|
            if prc.call(el) == true
                new_arr << el
            end
        end

        new_arr
    end

    
    def my_reject(&prc)
        new_arr = []
        self.my_each do |el|
            if prc.call(el) == false
                new_arr << el
            end
        end

        new_arr
    end


    def my_any?(&prc)
        self.my_each do |el| 
        
            return true if prc.call(el) 

        end
        return false
    end

    def my_all?(&prc)

        self.my_each do |el| 
        
            return false if !prc.call(el) 

        end
        return true

    end

    def my_flatten

        return [self] if self == !self.is_a?(Array)

        new_arr = []

        new_arr << self[0]
        new_arr += self[1..-1].my_flatten
        # (self.length - 1)
        new_arr

        

    end

end


p "----------------Question 1----------------"


return_value = [1, 2, 3].my_each do |num|
    puts num
   end.my_each do |num|
    puts num
   end
# => 1
# 2
# 3
# 1
# 2
# 3​

p return_value  # => [1, 2, 3]​

p "----------------Question 2----------------"

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []


p "----------------Question 2----------------"
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

p "----------------Question 3----------------"

p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true



p "----------------Question 4----------------"
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]