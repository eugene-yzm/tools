#Simple tool 

require 'nokogiri'
require 'open-uri'


def get_files(addr, xtn)
	target_site = addr
	file_extension = xtn

	doc = Nokogiri::HTML(open(target_site))

	doc.css('a').each do |link|
	  if link['href'] =~ /\.pdf$/
	  		name = link['href'].split('/')[-1]
	     File.open(name, 'wb') do |file|
	     	puts 'Processing download: ' + name
	     	begin
	     		if target_site[-1] == "/"
	     			d_file = open(target_site.chop + link['href'])
	     			file.write(d_file.read())
	     		else
	     			d_file = open(target_site + link['href'])
	     			file.write(d_file.read())
	     		end
	        	puts 'Done'	     	
	     	rescue
	     		puts "An error occurred, could not download: " + name
	     	end

	    end
	  end
	end
end

#get_files('http://lsntap.org/GIS_Data_GE_Geocode', 'xls')
get_files('http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-00-introduction-to-computer-science-and-programming-fall-2008/exams/', 'pdf')