Then(/^user "(.*?)" is created$/) do |mail|
  expect(User.first(:email => mail)).to_not eq(nil)
end

Then(/^user "(.*?)" is not created$/) do |mail|
  expect(User.first(:email => mail)).to eq(nil)
end

Given(/^the user "(.*?)" exists$/) do |username|
  User.create(:email => 'example@mail.com', 
  						:password => '123456',
  						:password_confirmation => '123456',
  						:name => 'Jose',
  						:username => username)
	
end

