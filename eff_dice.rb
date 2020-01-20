# Based off of https://www.eff.org/dice

require 'csv'
require 'securerandom'

## Globals

# Hash structure for storing the passphrase words by their 5 digit number
WORD_MAP = {}

# We can treat the wordlist as a CSV file that is delimited by a tab character
CSV.open('eff_large_wordlist.txt', 'r', col_sep: "\t") do |csv|
  # Cast the number to an Integer and use this as the key
  # The value is the word as a String
  csv.each { |row| WORD_MAP[row[0].to_i] = row[1] }
end

## Support methods

# This method returns the result of a random die roll
#
# @return [Integer] random number between 1 and 6
def roll_die
  SecureRandom.random_number 1..6
end

# This method returns the results of 5 dices
#
# @return [Array<Integer>] An array with 5 random numbers returned from :roll_die:
def roll_five_dice
  Array.new(5) { roll_die }
end

# Using the results of 5 random die rolls, determine a random passphrase word as stored in :WORD_MAP:
#
# @return [String] random word
# @raise [KeyError] raised if the random number does not have a known word
def random_word
  dice_results = roll_five_dice
  dice_number = dice_results.join.to_i

  WORD_MAP.fetch dice_number
end

## Main program

num_of_words = (ARGV.shift || 6).to_i
words = Array.new(num_of_words) { random_word }

puts words.join(' ')
