require 'rubygems'
require 'nokogiri'
require 'open-uri'



def get_the_email_of_a_townhal_from_its_webpage(link, name)
page = Nokogiri::HTML(open(link))
page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
	liste = Hash.new
	liste["Name"] = name
	liste["Email"] = node.text
	@final.push(liste)
end
end
def get_all_the_urls_of_val_doise_townhalls(adresse)
@final = Array.new
page = Nokogiri::HTML(open(adresse))
links = page.css("a.lientxt")
links.each do |link| 
	a = link['href'][1..-1]
	b = link.text
	get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com"+a, b)
end
print @final
end

get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/val-d-oise.html')





