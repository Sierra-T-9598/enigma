class OffsetMaker
  attr_reader :date, :offsets
  def initialize(date)
    @date = date
    @offsets = {}
  end

  def offset(date)
    squared = ((date.to_i)**2).to_s
    @last_four = squared[-4..-1]
    # require "pry"; binding.pry
  end

  def set_offsets
    offset(date)
    # @offsets = Hash.new
    @offsets["A"] = @last_four[0]
    @offsets["B"] = @last_four[1]
    @offsets["C"] = @last_four[2]
    @offsets["D"] = @last_four[3]
    @offsets
  end
end
