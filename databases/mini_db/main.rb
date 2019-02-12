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

scan = Scan.new('./movies_small.csv')
sel = Select.new(scan, MOVIE_COLUMNS[:title], 'EQUAL', 'Grumpier Old Men (1995)')
p = Project.new(sel, [MOVIE_COLUMNS[:id], MOVIE_COLUMNS[:title]])

query_plan = [
  ['PROJECT', [MOVIE_COLUMNS[:title]]],
  ['SELECT', [MOVIE_COLUMNS[:id], 'GREATER THAN', '4']],
  ['SCAN', ['./movies_small.csv']]
]

e = Executor.new(query_plan)
e.build
e.call