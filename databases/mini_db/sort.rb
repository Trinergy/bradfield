# Sort does not return EOF (may need to revise)

class Sort
  attr_reader :buffer, :child_node, :order, :complete, :column_index

  def initialize(child_node, column_index, order='ASC')
    @buffer= []
    @child_node = child_node
    @column_index = column_index
    @order = order
    @complete = false
  end

  def next
    while true do
      row = child_node.next

      break if row == "EOF"

      @buffer << row if !row.nil?
    end

    return buffer.sort { |a,b| b[column_index] <=> a[column_index] } if order == 'DESC'
    buffer.sort { |a,b| a[column_index] <=> b[column_index] }
  end
end
