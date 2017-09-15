require 'open-uri'
require 'nokogiri'
require 'json'

page_id = 28036335

doc = Nokogiri::HTML(open("https://www.ncbi.nlm.nih.gov/pubmed/#{page_id}"))
puts doc.class

keys = doc.css('.keywords').text
authors = Array.new

doc.css('.auths').css('a').each do |a|
  authors.push(a.text)
end

title = doc.css('h1').text
#print(title)

abstr = doc.css('.abstr').css('div').css('p').css('abstracttext').text

temp = {
    "id" => page_id,
    "title" => title,
    "keywords" => keys,
    "abstract" => abstr,
    "authors" => authors
}

File.open("#{page_id}.json", "w") {|f|
f.puts JSON.pretty_generate(temp) }

#end

#print(temp)

#File.open("pubmed/pmJsons/id.json","w") do |f|
#  f.write(JSON.pretty_generate(temp))
#  puts JSON.pretty_generate(temp)
#  print(f)
#end

#print(temp)


