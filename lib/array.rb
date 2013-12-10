class Array

  def insertion_sort
    sorted = [self.shift]
    unsorted = self
    unsorted_item = unsorted[0]
    
    while unsorted_item      
      if unsorted_item >= sorted[-1]
        sorted << unsorted.shift
      else
        sorted.each_with_index do |s, i|
          if s > unsorted_item
            sorted.insert(i, unsorted.shift)
            break
          end
        end
      end
      unsorted_item = unsorted[0]
    end
    sorted
  end

  def quick_sort(list = self)

  end

end