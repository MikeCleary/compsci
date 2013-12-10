class Fibonacci
  class << self
    
    def seq(start = 0, max = 35)
      sequence = []
      (start..max).each do |position|
        sequence << fib(position)        
      end
      sequence
    end

    def fib(position)
      if position >= 2
        n = fib(position - 1) + fib(position - 2)
      else
        n = position
      end
    end

    def iterative_seq(start=0, max=35)
      sequence = (start..max).to_a
      results = [0, 1]
      sequence.each do |n|
        if n > 1
          results << sequence[n] = sequence[n-1] + sequence [n-2]
        end
      end
      results
    end

  end
end