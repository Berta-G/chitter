Feature: A registered user can log in

Background:
	Given the user "Pepe" exists

Scenario: Logs in with correct credentials
	Given I am on the log in page
	And I fill in "username" with "Pepe"
	And I fill in "password" with "123456"
	When I press "Log in"
	Then I should see "Logged in as: Pepe"

