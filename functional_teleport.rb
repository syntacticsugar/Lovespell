# Before I embarked upon the glowing, red land of Ruby, I was seduced into computer programming by the notion of functional programming.  Functional programming sounded so pure, magical, fantastic.  Ruby is a multi-paradigm language, so I was heavily looking forward to seeing it bend left and right and show its functional roots.
# This script was written two weeks after I started Ruby.  It contains a 'recursion' of sorts, and a few functional one-liners.



class MagicBeams
	def initialize
		@twolinebreaks = "\n\n"
		@laserbeams = "**********LASER BEAMS SOUNDS********"
		@fadinglaserbeams = "********FADING LASER BEAM SOUNDS********"
	end

	def inquire_qty # my n00b wannabe attempt at functional pr0gr4mm1ng
		puts "Enter the number of subjects you would like to teleport."
		qty = gets.chomp.to_i      #return value : qty, for proceed_to_teleport(inquire_qty)
	end

	def proceed_to_teleport(qty)
		case 
		when qty <= 0
			puts "Well, the goal of teleporting a subject is to actually teleport the subject, so we will try again."
			proceed_to_teleport(inquire_qty)		
		when qty == 1
			teleport_singular
		when qty >= 2
			teleport_plural
		end
	end

	def teleport_singular
		puts "Alright. Enter the name of this person."
		name = gets.chomp.capitalize
		puts name + ", you say? Press \"Enter\" to confirm."
		gets
		puts @twolinebreaks * 2 + @laserbeams +@twolinebreaks * 2 + name + " has entered the wormhole, congratulations!  You've successfully beamed #{name} over!" + @twolinebreaks * 2 + @fadinglaserbeams + @twolinebreaks * 3
	end

	def teleport_plural
		puts "So you're teleporting more than one person. Enter their names, separated by commas."
		names = gets.chomp.split(",").map{ |x| x.lstrip.capitalize }
		last_subject = names.pop # important: pop is a DESTRUCTIVE method. changes names!
		all_subjects = names.join(", ") + " and " + last_subject
		puts "\n" * 3 + all_subjects +  " have entered the wormhole, congratulations!"	
		puts "\n" * 3 + "Invite #{all_subjects} to travel again, any time." + "\n" * 3
	end

end

execute = MagicBeams.new 
qty = execute.inquire_qty
execute.proceed_to_teleport(qty)

# execute = MagicBeams.new
# execute.proceed_to_teleport(execute.inquire_qty)
