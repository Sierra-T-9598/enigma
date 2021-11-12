class KeyMaker
  attr_accessor :key, :keys
  def initialize(key = nil)
    @key = generate(key)
    @keys = {}
    # @a_key = key[0..1]
    # @b_key = key[1..2]
    # @c_key = key[2..3]
    # @d_key = key[3..4]
    # require "pry"; binding.pry
  end

  def generate(key)
    if key == nil
      @key = 5.times.map{rand(5)}.join
    else
      key
    end
  end

  def generate_four_keys(key)
    @keys["A"] = (a_key = key[0..1])
    @keys["B"] = (b_key = key[1..2])
    @keys["C"] = (c_key = key[2..3])
    @keys["D"] = (d_key = key[3..4])
    @keys
  end
end
