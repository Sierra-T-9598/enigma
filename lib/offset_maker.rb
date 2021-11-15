require 'date'
class OffsetMaker
  attr_reader :date, :offsets
  def initialize(date = nil)
    @date = generate(date)
    @offsets = set_offsets
  end

  def generate(date)
    if date == nil
      @date = Date.today.strftime("%m%d%y")
    else
      date
    end
  end

  def offset
    squared = ((@date.to_i)**2).to_s
    @last_four = squared[-4..-1]
  end

  def set_offsets
    offset
    @offsets = {}
    @offsets["A"] = @last_four[0]
    @offsets["B"] = @last_four[1]
    @offsets["C"] = @last_four[2]
    @offsets["D"] = @last_four[3]
    @offsets
  end
end
