require 'csv'
require 'pry'

class Scan
  attr_reader :csv_path
  attr_accessor :data, :row_index
  
  def initialize(csv_path)
    @csv_path = csv_path
    @data = []
    @row_index = 0
  end

  def call
    @data = CSV.read(csv_path)
  end

  def hasNext
    !data[row_index].nil?
  end

  def next
    return if !hasNext

    nextRow = data[row_index]
    @row_index = row_index + 1
    nextRow
  end

  def close
    # clean-up
  end
end