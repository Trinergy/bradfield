# SINGLE TABLE QUERIES ONLY ATM
class Executor
  attr_reader :query_plan, :root_node, :nodes_buffer, :initial_run

  def initialize(query_plan)
    @query_plan = query_plan
    @nodes_buffer = []
    @initial_run = true
  end

  def build
    if initial_run
      scan_node = initialize_scan_node(query_plan.pop)
      @nodes_buffer << scan_node
      @initial_run = false
    end
    
    query_plan.reverse_each do |node_plan|
      child_node = nodes_buffer.pop
      @nodes_buffer << initialize_node(node_plan[0],child_node, node_plan[1])
    end
  end

  def call
    root_node = nodes_buffer[0]

    while root_node.next != "EOF" do
    end
  end

  private
  
  def initialize_scan_node(node_plan)
    klass = Object.const_get(node_plan[0].capitalize)
    klass.new(node_plan[1][0])
  end

  def initialize_node(node,child_node, args)
    klass = node.capitalize
    case klass
    when 'Select'
      Object.const_get(klass).new(child_node, args[0], args[1], args[2])
    when 'Project'
      Object.const_get(klass).new(child_node, args)
    else
      "NOPE"
    end
  end
end