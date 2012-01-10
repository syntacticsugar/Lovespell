class Lovespell
	def initialize(*potions)
	@potions = potions
	end

	def crush
	puts "To initiate a crush, procure #{@potions.map(&:capitalize).join(", ")} and slip these items into their breakfast."
	end

	def infatuation
puts "To initiate an infatuation, slip #{@potions.map(&:upcase).join(", ")} in their coffee."
	end

	def killspell
puts "To break the spell, dribble #{@potions.map(&:reverse).join(", ")} on their pillow."
	end
end

cutemathematician= Lovespell.new("honey", "saffron", "chocolate")
cutemathematician.crush
cutemathematician.infatuation
cutemathematician.killspell

puts "\n" * 3

girlwithtattoo = Lovespell.new( "agave nectar", "yogurt", "roasted almonds", "vanilla", "hazelnuts")
girlwithtattoo.crush
girlwithtattoo.infatuation
girlwithtattoo.killspell


puts "\n" * 3
