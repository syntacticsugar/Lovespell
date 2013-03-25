class Brood
  NAMES = %w( feathers quill falcon aerie nest eggs smokey skittles cereal merlin).map &:capitalize
  def initialize(n)
    @names = NAMES.sort {rand - 0.5}.take n
  end
  def hatch
    if @names.empty?
      raise EmptyNestException
    else
      n = @names.shift
      f = rand 10
    Bird.new n, f
  end
end

class EmptyNestException < StandardError; end
end

class Animal
  def initialize(name, fuzziness)
    if name.is_a?(String) && fuzziness >= 0 && fuzziness <= 10 
      @name = name 
      @fuzziness = fuzziness
    else
      raise InanimateObjectException
  end
end

class InanimateObjectException < StandardError; end
  attr_reader :name, :fuzziness
end

class Bird < Animal
  def eggs(n)
    Brood.new n
  end
end
