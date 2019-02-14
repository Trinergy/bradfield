class Limit
  attr_reader :child_node, :limit, :n

  def initialize(child_node, limit)
    @child_node = child_node
    @limit = limit
    @n = 0
  end

  def next
    row = child_node.next

    return if row.nil?
    return "EOF" if row == "EOF"

    @n = n + 1
    return row if n <= limit
    
    "EOF"
  end
end
