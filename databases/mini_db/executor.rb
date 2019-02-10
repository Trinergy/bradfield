require './project'
require './scan'
require './select'

# DEV
require 'pry'

MOVIE_COLUMNS = {
  id: 0,
  title: 1,
  genres: 2
}

scan = Scan.new('../ml-20m/movies.csv')
sel = Select.new(scan, MOVIE_COLUMNS[:title], 'Toy Story (1995)')
p = Project.new(sel, [MOVIE_COLUMNS[:id], MOVIE_COLUMNS[:title]])

binding.pry