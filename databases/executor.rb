require './scan'
require './select'
require 'pry'

scan = Scan.new('./ml-20m/movies.csv')
select = Select.new(scan, 1, 'Toy Story (1995)')

binding.pry