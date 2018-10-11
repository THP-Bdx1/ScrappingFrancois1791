require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_price

loop do

names = Array.new
prix = Array.new
final = Array.new

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

nom = page.css ("a.currency-name-container")
nom.each do |i|
	names << i.text
end

crypto = page.css("a.price")
crypto.each do |info|
	prix << info.text
end

c= 0
names.length.times do |answer|
	hasho = Hash.new
	hasho["Devise"] = names[c]
	hasho["Prix"] = prix[c]
	final << hasho
	c += 1
end

puts final
puts
puts "Nouvelle actualisation dans 20 secondes"
sleep(20)
puts "Actualisation en cour"
end

end

get_the_price





get_the_price