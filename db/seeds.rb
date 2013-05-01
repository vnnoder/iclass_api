# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


mike = User.find_or_create_by_username("michael") do |record|
	record.password = "secret"
	record.name = "Michael"	
end

student = User.find_or_create_by_username("johndoe") do |record|
	record.password = "secret"
	record.name = "John Doe"	
end

Session.delete_all
session1 = Session.where(:name => "Mobile Wireless Application Development (Day 1/5)").first_or_create(:description => "iOS application development Day 1/5 - Mobile Network Technology", :start_date => Date.yesterday, :end_date => Date.yesterday, :status => 2, :user_id => mike.id)
session2 = Session.where(:name => "Mobile Wireless Application Development (Day 2/5)").first_or_create(:description => "iOS application development Day 2/5 - Objective-C, View Controller", :start_date => Date.today, :end_date => Date.today, :status => 0, :user_id => mike.id)
session3 = Session.where(:name => "Mobile Wireless Application Development (Day 3/5)").first_or_create(:description => "iOS application development Day 3/5 - Memory Management, Networking", :start_date => Date.tomorrow, :end_date => Date.tomorrow, :status => 1, :user_id => mike.id)

Question.find_or_create_by_title("Did any Singapore Telco implement real 4G network?") do |record|
	record.detail = nil
	record.user = student
	record.session = session1
end

Question.find_or_create_by_title("How to create getters and setters automatically in Objective-C?") do |record|
	record.detail = nil
	record.user = student
	record.session = session2
end

