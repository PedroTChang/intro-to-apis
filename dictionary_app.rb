require "http"

system "clear"
puts "Welcome to the Dictionary App!"
puts "Enter a word: "
word = gets.chomp
system "clear"

dict_entry = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

definition = dict_entry.parse(:json)[3]["text"]

###

examples = HTTP.get("https://api.wordnik.com/v4/word.json/ostentatious/topExample?useCanonical=false&api_key=")

top_example = examples.parse(:json)["text"]

puts "This is the definition:"
puts definition
puts "\n"
puts "And here is the top example:"
puts top_example
puts "\n"
# # starting to ask for top example and pronunciation
# # pp dict_entry.parse(:json)
# pp examples.parse
