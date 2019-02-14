# Distinct assumes its child node returns sorted rows
class Distinct
  attr_reader :child_node, :previous_row

  def initialize(child_node)
    @previous_row= nil
    @child_node = child_node
  end

  def next
    row = child_node.next
    return if row == previous_row
    return "EOF" if previous_row == "EOF"

    @previous_row = row
  end
end
