def partition_array(array, left_most, right_most, pivot_index)
  pivot_value = array[pivot_index]
  array[pivot_index], array[right_most] = array[right_most], array[pivot_index]
  saved_index = left_most

  (left_most..right_most-1).each do |i|
    if array[i] < pivot_value
      array[i], array[saved_index] = array[saved_index], array[i]
      saved_index = saved_index + 1
    end
  end

  array[saved_index], array[right_most] = array[right_most], array[saved_index]
  return saved_index
end

def inplace_quicksort(array, left_most, right_most)
  return array if array.length <= 1
  if left_most < right_most
    pivot_index = (left_most + ((right_most - left_most) / 2)).to_i
    new_pivot_index = partition_array(array, left_most, right_most, pivot_index)
    inplace_quicksort(array, left_most, new_pivot_index - 1)
    inplace_quicksort(array, new_pivot_index + 1, right_most)
  end

  return array
end

names = [3, 8, 2, 5, 1, 4, 7, 6]
other_array = [13, 14, 12, 18, 15, 17, 19, 16]
one_element_array = [5]

p inplace_quicksort(other_array, 0, other_array.length - 1)
p inplace_quicksort(names, 0, names.length - 1)
p inplace_quicksort(one_element_array, 0, one_element_array.length - 1)