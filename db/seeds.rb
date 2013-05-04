User.delete_all
mike = User.find_or_create_by_username!("michael") do |record|
	record.password = "secret123"
	record.name = "Michael"	
	record.email = "mitanac@gmail.com"
	record.password_confirmation = "secret123" 	
end

student = User.find_or_create_by_username!("johndoe") do |record|
	record.password = "secret123"
	record.name = "John Doe"	
	record.email = "john_doe@gmail.com"
	record.password_confirmation = "secret123" 	
end

Talk.delete_all
talk1 = Talk.where(:title => "Mobile Wireless Application Development (Day 1/5)").first_or_create(:description => "iOS application development Day 1/5 - Mobile Network Technology", :start_date => Date.yesterday, :end_date => Date.yesterday, :status => 2, :user_id => mike.id)
talk2 = Talk.where(:title => "Mobile Wireless Application Development (Day 2/5)").first_or_create(:description => "iOS application development Day 2/5 - Objective-C, View Controller", :start_date => Date.today, :end_date => Date.today, :status => 0, :user_id => mike.id)
talk3 = Talk.where(:title => "Mobile Wireless Application Development (Day 3/5)").first_or_create(:description => "iOS application development Day 3/5 - Memory Management, Networking", :start_date => Date.tomorrow, :end_date => Date.tomorrow, :status => 1, :user_id => mike.id)

Question.delete_all
Question.find_or_create_by_title!("Did any Singapore Telco implement real 4G network?") do |record|
	record.detail = nil
	record.user_id = student.id
	record.talk_id = talk1.id
end

Question.find_or_create_by_title!("How to create getters and setters automatically in Objective-C?") do |record|
	record.detail = nil
	record.user_id = student.id
	record.talk_id = talk2.id
end

