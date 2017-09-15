require 'net/http'
stack = Net::HTTP.new 'fi.wikipedia.org'
# ...later...
page = 'wiki/Mika_Häkkinen'

html = stack.get(page).body

print(html)