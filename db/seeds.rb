# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Session.where(:name => "Mobile Wireless Application Development (Day 1/5)").first_or_create(:description => "iOS application development Day 1/5 - Mobile Network Technology", :start_date => Date.yesterday, :end_date => Date.yesterday, :status => 2)
Session.where(:name => "Mobile Wireless Application Development (Day 2/5)").first_or_create(:description => "iOS application development Day 2/5 - Objective-C, View Controller", :start_date => Date.today, :end_date => Date.today, :status => 0)
Session.where(:name => "Mobile Wireless Application Development (Day 3/5)").first_or_create(:description => "iOS application development Day 3/5 - Memory Management, Networking", :start_date => Date.tomorrow, :end_date => Date.tomorrow, :status => 1)
