require 'spec_helper'

RSpec.describe Search do
  describe '.find' do
    context 'with guess' do
      context 'with an array' do
        it 'thanks user for guess if there is a guess' do
          expect(Search.find(24, [1,2])[0]).to eq 'thank you for your guess and array'
        end
      end

      context 'without an array' do
        it 'reminds user to provide an array' do
          expect(Search.find(24, nil)).to eq 'please provide a number to search for and array'
        end
      end
    end

    context 'without guess' do
      context 'with an array' do
        it 'reminds user to provide a guess' do
          expect(Search.find(nil, [20])).to eq 'please provide a number to search for and array'
        end
      end

      context 'without an array' do
        it 'reminds user to add an array and guess' do
          expect(Search.find(nil, nil)).to eq 'please provide a number to search for and array'
        end
      end
    end
  end

  describe '.find_it_linear' do
    it 'returns true, and number of steps, if it finds the number' do
      the_array = [1, 2, 3, 4, 19, 72, 1046, 18935]
      guess = 18935
      expect(Search.find_it_linear(guess, the_array)).to eq([true, 8])
    end

    it 'returns false, and number of steps, if it does not find the number' do
      the_array = [1, 19, 72, 1046,18935]
      guess = 898888
      expect(Search.find_it_linear(guess, the_array)).to eq([false, 5])
    end
  end

  describe '.find_it_binary_search' do
    it 'returns true, and number of steps, if it finds the number' do
      the_array = [1, 2, 3, 4, 19, 72, 1046, 18935]
      guess = 18935
      expect(Search.find_it_binary_search(guess, the_array)).to eq([true, 3])
    end

    it 'returns false, and number of steps, if it does not find the number' do
      the_array = [1, 19, 72, 1046, 18935]
      guess = 898888
      expect(Search.find_it_binary_search(guess, the_array)).to eq([false, 2])
    end

    it 'finds lowerbound' do
      the_array = [1, 2, 3, 4, 5, 6]
      guess = 1
      expect(Search.find_it_binary_search(guess, the_array)).to eq([true, 1])
    end

    it 'finds upperbound' do
      the_array = [1, 2, 3, 4, 5, 6]
      guess = 6
      expect(Search.find_it_binary_search(guess, the_array)).to eq([true, 2])
    end
  end

  context 'searching via binary search is faster than linear search' do
    it 'takes less steps with binary search' do
      the_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 100, 101, 201, 301, 401, 501]
      guess = 501
      results_linear = Search.find_it_linear(guess, the_array)
      results_binary = Search.find_it_binary_search(guess, the_array)

      expect(results_linear[1]).to be > results_binary[1]
    end
  end
end
