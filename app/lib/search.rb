require 'byebug'

class Search
  def self.find(guess, the_array)
    if guess && the_array
      message = 'thank you for your guess and array'
      result = find_it_binary_search(guess, the_array)
      [message, result].flatten
    else
      'please provide a number to search for and array'
    end
  end

  def self.find_it_linear(guess, the_array)
    step_counter = 0

    the_array.sort.each do |item|
      step_counter += 1
      if item == guess
        return [true, step_counter]
      end
    end

    [false, step_counter]
  end

  def self.find_it_binary_search(guess, the_array)
    the_array = the_array.sort
    step_counter = 0
    lowest_index = 0
    highest_index = the_array.size - 1
    the_middle_index = middle_index(lowest_index, highest_index)

    while the_array[lowest_index] < the_array[highest_index] do
      step_counter += step_counter

      if guess < the_array[the_middle_index]
        highest_index = the_middle_index - 1
      else
        lowest_index = the_middle_index + 1
      end

      the_middle_index = middle_index(lowest_index, highest_index)
      return [true, step_counter] if guess == the_array[the_middle_index]
    end

    [false, step_counter]
  end


  private

  def self.middle_index(lowest, highest)
    (lowest + highest) / 2
  end
end
