require 'csv'
require 'pry'
require './select'

class Scan
  attr_reader :csv_path
  attr_accessor :buffer

  def initialize(csv_path)
    @csv_path = csv_path
    @buffer = nil
  end

  def next
    return @buffer.shift if @buffer

    @buffer = CSV.open(csv_path)
    @buffer.shift
  end

  def close
    # clean-up
  end
end

s = Scan.new('./movies_small.csv')
x = Select.new(s, 1, "Toy Story (1995)")

binding.pry
