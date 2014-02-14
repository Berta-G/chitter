Feature: A user can sign up to the service

Scenario: A user signs up with correct data
	Given I am on the sign up page
	When I fill in "email" with "example@mail.com"
	And I fill in "password" with "123456"
	And I fill in "password_confirmation" with "123456"
	And I fill in "name" with "Jose" 
	And I fill in "username" with "Pepe"
	And I press "Sign up"
	Then I should see "Welcome to chitter, Pepe"
