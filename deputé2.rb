require 'rubygems'
require 'nokogiri'
require 'open-uri'


email=Hash.new
names=Hash.new
@final = Array.new


def name_scrap

page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
nomliste = page.css("div#deputes-list a")
nomliste.each do |i|
names = i.text.split[1..-1]
url = i["href"]
#nom_prenom = Array.new
puts names
#nom_prenom << names[0]
#nom_prenom << names[1] 	
@final.push(names)

mail_scrap("#[url]")


end


def mail_scrap(url)

page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr" + "#{url}"))
mail_href = page.xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[1]/a")
mail_href.each do |n|
email["Email"]=n["href"][7..-1]
@final.push(email)
end	
end
print @final

end

name_scrap