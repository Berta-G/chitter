Given(/^user "(.*?)" is logged in$/) do |username|
  visit '/'
  fill_in 'username', :with => username
  fill_in 'password', :with => "123456"
  click_button 'Log in'
end