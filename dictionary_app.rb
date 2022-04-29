require "http"

system "clear"
puts "Welcome to the Dictionary App!"
puts "Enter a word: "
word = gets.chomp

response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

dict_entry = response.parse(:json)
definition = dict_entry[3]["text"]

puts definition
# starting to ask for top example and pronunciation
