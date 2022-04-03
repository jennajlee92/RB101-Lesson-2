# a method that returns the sum of two integers

def sum(array)
  if array.length == 2
    sum = 0
    iter = 0
    while iter < array.length
      sum += array[iter]
      iter += 1
    end
    sum
  else
    Kernel.puts("Woops! We need two integers only.")
  end
end

p sum([1,2]) # => 3
p sum([1,2,3]) # => "Woops! We need two integers only."

# a method that takes an array of strings and returns a string that is all those strings concat together

def concatenate(array)
  final_string = ""
  array.each { |string| final_string << string }
  final_string
end

p concatenate(["s", "e", "n", "s", "i", "b", "l", "e"]) # => “sensible”

# a method that takes an array of integers and returns a new array with every other element from the original array, starting with the first element

def everyOther(array)
  final_array = []
  iter = 0
  while iter < array.length
    final_array.push(array[iter])
    iter += 2
  end
  final_array
end

p everyOther([1,4,7,2,5]) # => [1,7,5]

# returns index of 3rd occurrence of a given character in a string

def occurrence(char, string)
  idx = nil
  iter = 0
  count = 0
  until count == 3 || iter == string.length
    if string[iter] == char
      count += 1
    end
    iter += 1
  end
  if count == 3
    idx = iter - 1
  end
  idx
end

p occurrence('x', 'axbxcdxex') # => 6

# return result of merging two arrays of numbers, with first array in the even position and second in the odd

def merge(first_array, second_array)
  final_array = []
  iter = 0
  while second_array != []
    if iter == 0 || iter % 2 == 0
      final_array.push(first_array.shift)
    else
      final_array.push(second_array.shift)
    end
    iter += 1
  end
  final_array
end

p merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]