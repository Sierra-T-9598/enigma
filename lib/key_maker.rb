class KeyMaker
  attr_accessor :key
  def initialize(key = nil)
    @key = generate(key)
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
    a_key = key[0..1]
    b_key = key[1..2]
    c_key = key[2..3]
    d_key = key[3..4]
  end
end