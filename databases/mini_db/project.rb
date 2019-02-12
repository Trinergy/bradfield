class Project
  attr_reader :child_node, :columns

  def initialize(child_node, columns)
    @child_node = child_node
    @columns = columns
    @output = []
  end

  def next
    row = child_node.next

    return if row.nil?
    return "EOF" if row == "EOF"

    output_row = []

    columns.each { |c| output_row << row[c] }

    @output << output_row
    pp output_row
  end
end
