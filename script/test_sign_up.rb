require 'net/http'
url = URI.parse('http://localhost:3000/api/registrations')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"user[username]" => "test", "user[password]" => "test12345", "user[password_confirmation]" => "test12345"})
res = Net::HTTP.start(url.host, url.port) {|http|
	    http.request(req)
	  }
puts res.body	  