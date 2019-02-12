require 'csv'

class Scan
  attr_reader :buffer, :csv_path, :with_header, :initial_run

  def initialize(csv_path, with_header=true, initial_run=true)
    @csv_path = csv_path
    @buffer = nil
    @with_header = with_header
    @initial_run = initial_run
  end

  def next
    if initial_run
      @buffer = CSV.open(csv_path) 
      buffer.shift if buffer && with_header && initial_run
      @initial_run = false
    end

    return "EOF" if buffer.eof?

    buffer.shift
  end
end
