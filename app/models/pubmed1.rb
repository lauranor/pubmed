require 'httparty'
require 'json'


response = HTTParty.get("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&mindate=1800/01/01&maxdate=2016/12/31&usehistory=y&retmax=500&retmode=json")

parsed_resp = JSON.parse(response.body)
idlist = parsed_resp["esearchresult"]["idlist"]
webenv = parsed_resp["esearchresult"]['webenv']
print(idlist)



#idlist.each do |a|
  #"#{new_id = a.to_s
  #article = HTTParty.post("http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&rettype=abstract&id=#{new_id}")
  #print(article)
#end