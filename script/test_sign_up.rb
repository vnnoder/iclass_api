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
req = Net::HTTP::Delete.new(url.path)
req.set_form_data({"user_login[username]" => "test"})
res = Net::HTTP.start(url.host, url.port) {|http|
	    http.request(req)
	  }
puts res.body	  

#Create first talk
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"talk[title]" => "New Title", "talk[description]" => "New Description", "auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
	    http.request(req)
	  }
puts res.body

#get talk by passcode
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks/passcode/5eeaad')
req = Net::HTTP::Get.new(url.path)
req.set_form_data({"talk[title]" => "New Title", "talk[description]" => "New Description", "auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body


#join talk
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks/1/join')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

#list all talks
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks')
req = Net::HTTP::Get.new(url.path)
req.set_form_data({"auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

#list all joined talks
require 'net/http'
url = URI.parse('http://localhost:3000/api/joined_talks')
req = Net::HTTP::Get.new(url.path)
req.set_form_data({"auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

#join uncreated talk
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks/100/join')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

#start talk
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks/1/start')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

#end talk
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks/1/close')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

#create question
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks/1/questions')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"question[title]" => "Could you explain more about 3.5G?", "question[detail]" => "","auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

#get all questions
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks/1/questions')
req = Net::HTTP::Get.new(url.path)
req.set_form_data({"auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body


#vote for question
require 'net/http'
url = URI.parse('http://localhost:3000/api/talks/1/questions/5/vote')
req = Net::HTTP::Post.new(url.path)
req.set_form_data({"auth_token" => "xNSznUyK6uagS86u4JoV"})
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body