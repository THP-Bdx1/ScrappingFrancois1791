require 'rubygems'
require 'nokogiri'
require 'open-uri'

@final=Array.new


def depute_mail(url)
page = Nokogiri::HTML(open(url))
mails = page.xpath("/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[1]/a")
mails.each do |n|
liste_mail=Hash.new
liste_mail["Email"]=n["href"][7..-1]
		     @final.push(liste_mail)
	end
end

def depute_name
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
nomcomplet = page.css("div#deputes-list a")
nomcomplet.each do |i|
url = i["href"]
liste_nom=Hash.new
liste_nom["Nom"]=i.text.split[1..-1]
	 
	 depute_mail("http://www2.assemblee-nationale.fr"+ "#{url}")
	 @final.push(liste_nom)
	end
print @final
end


depute_name
