require "http"

system "Clear"
puts "This is a currency exchange calculator!"
puts "Please input the currency you would like to change to first: "
input_rate = gets.chomp
puts "Next input your dollar amount: "
input_usd = gets.chomp.to_i

response = HTTP.get("https://open.er-api.com/v6/latest/USD")

exchanges = response.parse(:json)["rates"]
# pp exchanges

puts response.parse(:json)["rates"][input_rate] * input_usd
