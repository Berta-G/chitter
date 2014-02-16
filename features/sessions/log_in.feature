Feature: A registered user can log in

Background:
	Given the user "Pepe" exists

Scenario: Logs in with correct credentials
	Given I am on the homepage
	And I fill in "username" with "Pepe"
	And I fill in "password" with "123456"
	When I press "Log in"
	Then I should see "Welcome to chitter, Pepe"

Scenario: Logs in with incorrect credentials
	Given I am on the homepage
	And I fill in "username" with "Pepe"
	And I fill in "password" with "ABCDEF"
	When I press "Log in"
	Then I should see "Incorrect username or password"

