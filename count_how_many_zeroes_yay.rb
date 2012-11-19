# a = [ 10, 20, 300, 4000, 0, 0 ]
# goal : WRITE A FUNCTION THAT REVEALS 
# how many times does the digit '0' pop up?


# BWAHAHAHHAHAHAH
# HERE IS WHAT I CAME UP WITH!!!!
# ROTFLMAO lolz lolz lolz

a = [ 10, 20, 300, 4000, 0, 0 ]

a.map(&:to_s).map{ |string| string.split("").flatten }.flatten.map{ |digit| digit == "0" ? "1" : "0" }.map(&:to_i).inject(:+)


# after recovering from my initial manic euphoria,
# I contacted a Ruby wizard buddy (github.com/spooner)
# who enlightened me on some RUBY MAGICZZZZ called
# 'flat_map' and 'count'

# I subsequently ran off to refactor:

# w/ 'flat_map'
a.flat_map{ |string| string.to_s.split("") }.map {|digit| digit == "0" ? "1" : "0" }.map(&:to_i).inject(:+)

# w/ 'count'
a.flat_map{ |string| string.to_s.split("") }.map(&:to_i).count(0)

# and lastly, the most terse way to go about it:
a.map(&:to_s).join.count "0"

# :D :D :D :D
