require "http"

while true
  system "clear"
  puts "Welcome to the Dictionary App!"
  puts "Please input your necessary definitions, we will provide the top example, and pronunciation!: "
  input_word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")

  definitions = response.parse(:json)

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=")

  top_example = response.parse(:json)

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=")

  pronunciations = response.parse(:json)

  puts "DEFINITIONS"

  index = 0
  definitions.length.times do
    definition = definitions[index]["text"]
    puts "#{index + 1}. #{definition}"
    index += 1
  end

  puts

  puts "TOP EXAMPLE"
  puts top_example["text"]

  puts

  puts "PRONUNCIATION"

  puts

  index = 0
  pronunciations.length.times do
    pronunciation = pronunciations[index]["raw"]
    puts "#{index + 1}. #{pronunciation}"
    index += 1
  end

  puts "Enter q to quit, another key to continue..."
  input_option = gets.chomp

  if input_option == "q"
    puts "Thank you so much! Goodbye!"
    break
  end
end
