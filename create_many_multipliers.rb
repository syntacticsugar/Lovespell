class Multiplier
  def self.create_multiplier n
    define_method("times_#{n}") do |value|
      value * n
    end
  end
  2.upto(10) do |n|
    create_multiplier n
  end
end
