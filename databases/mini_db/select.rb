class Select
  attr_reader :child_node, :column_index, :condition, :value

  @@CONDITION = {
    'EQUAL' => '==',
    'GREATER THAN' => '>',
    'GREATER THAN OR EQUAL TO' => '>=',
    'LESSER THAN' => '<',
    'LESSER THAN OR EQUAL TO' => '<='
  }

  def initialize(child_node, column_index, condition, value)
    @child_node = child_node
    @column_index = column_index
    @condition = condition
    @value = value
  end

  def next
    row = child_node.next
    return "EOF" if row == "EOF"

    return row if row[column_index].send(@@CONDITION[condition], value)
  end
end