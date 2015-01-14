#Simple tool that grabs all the files with a given extension on a webpage.

require 'nokogiri'
require 'open-uri'


def get_files(addr, xtn)
	target_site = addr
	file_extension = xtn

	doc = Nokogiri::HTML(open(target_site))

	doc.css('a').each do |link|
	  if link['href'] =~ /\b.+.#{file_extension}/
	  		name = link['href'].split('/')[-1]
	     File.open(name, 'wb') do |file|
	     	puts 'Processing download: ' + link['href']  
	        d_file = open(link['href'])
	        file.write(d_file.read())
	        puts 'Done'
	    end
	  end
	end
end

# Needs a full link to work right now. Sanitization of scraped links to come in future versions.
get_files('http://lsntap.org/GIS_Data_GE_Geocode', 'xls')

