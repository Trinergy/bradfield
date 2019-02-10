class Select
  attr_reader :child_node, :column_index, :value

  def initialize(child_node, column_index, value)
    @child_node = child_node
    @column_index = column_index
    @value = value
  end

  def next
    row = child_node.next
    return if row.nil?

    return row if row[column_index] == value
  end
end