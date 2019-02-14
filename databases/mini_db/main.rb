require './distinct'
require './executor'
require './limit'
require './project'
require './scan'
require './select'
require './sort'

# DEV
require 'pry'

MOVIE_COLUMNS = {
  id: 0,
  title: 1,
  genres: 2
}

scan = Scan.new('./movies_small.csv')
sort = Sort.new(scan, MOVIE_COLUMNS[:title], 'DESC')
distinct = Distinct.new(sort)
sel = Select.new(scan, MOVIE_COLUMNS[:title], 'EQUAL', 'Grumpier Old Men (1995)')
p = Project.new(sel, [MOVIE_COLUMNS[:id], MOVIE_COLUMNS[:title]])

scan2 = Scan.new('./movies_small.csv')
limit = Limit.new(scan, 4)
p2 = Project.new(limit, [MOVIE_COLUMNS[:id], MOVIE_COLUMNS[:title]])


query_plan = [
  ['PROJECT', [MOVIE_COLUMNS[:title]]],
  ['SELECT', [MOVIE_COLUMNS[:id], 'GREATER THAN', '4']],
  ['SCAN', ['./movies_small.csv']]
]

e = Executor.new(query_plan)
e.build
e.call

binding.pry