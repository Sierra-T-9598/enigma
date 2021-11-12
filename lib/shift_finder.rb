class ShiftFinder
  attr_reader :keys, :offsets
  def initialize(keys, offsets)
    @keys = keys
    @offsets = offsets
  end

  def sum_of_keys_and_offsets(keys, offsets)
    shifts = keys.merge(offsets) do |k, keys, offsets|
      (keys.to_i + offsets.to_i).to_s
    end
  end
end

# module Shiftable
#   def sum_of_keys_and_offsets(keys, offsets)
#     shift = (keys + offsets)
#     a_hash.merge(b_hash){ |k, a_value, b_value| a_value + b_value }
# end
