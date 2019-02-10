require './project'
require './scan'
require './select'
require './executor'

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

query_plan = [
  ['PROJECT', [MOVIE_COLUMNS[:title]]],
  ['SELECT', [MOVIE_COLUMNS[:id], '5000']],
  ['SCAN', ['../ml-20m/movies.csv']]
]

e = Executor.new(query_plan)
e.build
e.call