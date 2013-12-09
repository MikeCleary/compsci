class Factorial
  class << self
    def to(i)
      if i > 1
        i = i * to(i-1)
      else 
        return i
      end
    end
  end
end