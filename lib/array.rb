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
    if list.length > 1
      pivot = list.delete_at(list.length/2)
      right_list, left_list = [], []
      list.each { |list_item| list_item < pivot ? left_list << list_item : right_list << list_item }
      quick_sort(left_list)  + [pivot] + quick_sort(right_list)
    else
      list
    end
  end
end