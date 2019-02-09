class Select
  attr_reader :where_clause, :node
  attr_accessor :data, :row_index

  @@data = []

  def initialize(node, where_clause)
    @node = node
    @where_clause = where_clause
    @row_index = 0
  end

  def call
    while node.hasNext do
      @@data << node.next
    end
  end

  def hasNext
    !@@data[row_index].nil?
  end

  def next
    return if !hasNext

    nextRow = @@data[row_index]
    @row_index = row_index + 1
    nextRow if valid?(nextRow)
  end

#  private

  # Example Predicate: `WHERE title='Toy Story (1995)'`
  # Parse and Determine the index of column in row (After WHERE)
  # Parse and determine the comparison clause
  # Likely need some text parsing utility
  # STRETCH: Multiple WHERE statements
  def columns
    @@data[0]
  end

  def where_clause_value
    parsed_clause = where_clause.partition('=')
    predicate = parsed_clause[2]
  end

  def where_clause_column_index
    parsed_clause = where_clause.partition('=')
    column = parsed_clause[0].sub!('WHERE ', '')
    columns.find_index(column)
  end

  def valid?(row)
    row[where_clause_column_index] == where_clause_value 
  end
end