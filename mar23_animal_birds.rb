class Animal
  attr_accessor :name, :fuzziness
  def initialize(name, fuzziness)
    unless name.is_a?(String) && fuzziness.between?(0, 5)
      raise "name has to be a string and fuzziness has to be 1 - 10."
      @name, @fuzziness = name, fuzziness
    end
  end
end

class Bird < Animal
  def eggs(number)
    number.times.map { Egg.new }
  end
end

#okay the task is:
#10 names for birds, [0..5] for fuzziness
#when an egg is hatched, automatically assign a random NAME and fuzziness

class Egg
  NAMES = %w[feathers quill falcon aerie nest eggs smokey skittles cereal rotisserie].map(&:capitalize)
  FUZZINESS = (0..5).to_a
  
  def hatch
    # (the above is an attempt to quickly create:
    Bird.new(NAMES.sample, FUZZINESS.sample)
  end
end


# birdy = Bird.new("papabird", 5)
# nest = birdy.eggs(5)
# offspring = nest.map{|egg| egg.hatch }
# offspring.each{|bird| puts "#{bird.name} has #{bird.fuzziness} fuzziness!"}

january = Bird.new
january.eggs 5
(january.hatch).inspect


# puts
# rat = Animal.new("Buttons", 5)
# rat.name
# rat.fuzziness
# puts
# hedgehog = Animal.new("Needles", 1)
# hedgehog.name
# hedgehog.fuzziness

