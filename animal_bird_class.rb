require 'awesome_print'

class Animal
  attr_accessor :name, :fuzziness
  def initialize(name, fuzziness)
    # Guard conditions separate, at the top of the method.
    raise TypeError, "name has to be a String" unless name.is_a? String
    raise ArgumentError, "fuzziness has to be 0 to 5" unless fuzziness.between? 0, 5

    @name, @fuzziness = name, fuzziness
  end
end

class Bird < Animal
  def eggs(number)
    number.times.map { Egg.new }
  end
end

# okay the task is:
# 10 names for birds, [0..5] for fuzziness
# when an egg is hatched, automatically assign a random NAME and fuzziness

class Egg
  NAMES = %w[feathers quill falcon aerie nest eggs smokey skittles cereal rotisserie].map(&:capitalize)
  FUZZINESS = (0..5).to_a

  def initialize
    @hatched = false # make sure we only hatch once.
  end
  def hatch
    # guard condition
    raise "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~NUH UH~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" if @hatched
    # (the above is an attempt to quickly create:
    chick = Bird.new(NAMES.sample, FUZZINESS.sample)
    @hatched = true
    chick # This gets returned implicitly.
  end
end

# Create an egg then hatch it.
bluejay = Egg.new
bird = bluejay.hatch
ap bird

# Create several eggs and hatch them
eggs = bird.eggs 4
ap eggs

chicks = eggs.map &:hatch
ap chicks

# Try to hatch more chicks from the same eggs.
zombie_chicks = eggs.map &:hatch
ap zombie_chicks


