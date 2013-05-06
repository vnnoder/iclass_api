#Sign up
require 'net/http'
url = URI.parse('http://localhost:3000/api/sign_up')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"user[username]" => "test", "user[password]" => "test12345", "user[password_confirmation]" => "test12345"})
res = Net::HTTP.start(url.host, url.port) {|http|
	    http.request(req)
	  }
puts res.body	

#Sign IN
require 'net/http'
url = URI.parse('http://localhost:3000/api/sign_in')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"user_login[username]" => "test", "user_login[password]" => "test12345"})
res = Net::HTTP.start(url.host, url.port) {|http|
	    http.request(req)
	  }
puts res.body	  

#Sign out
require 'net/http'
url = URI.parse('http://localhost:3000/api/sign_out')
pust "url.path = #{url.path} \t url.port = #{url.port}"
req = Net::HTTP::Delete.new(url.path)
req.set_form_data({"user_login[username]" => "test"})
res = Net::HTTP.start(url.host, url.port) {|http|
	    http.request(req)
	  }
puts res.body	  