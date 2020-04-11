#!/usr/bin/env ruby
require_relative 'lib/search'

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 100, 101, 201, 301, 401, 501]
arr = (1..90000000).to_a
puts Search.find(9900000, arr)
