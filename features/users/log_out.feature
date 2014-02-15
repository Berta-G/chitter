Feature: User can Log out

Background: 
	Given the user "Pepe" exists
	
Scenario: User logs out
	Given I am on the homepage
	And I fill in "username" with "Pepe"
	And I fill in "password" with "123456"
	When I press "Log in"
	Then I should see "Logged in as: Pepe"
	When I press "Log out" 
	Then I should see "Goodbye"
	And I should not see "Logged in as: Pepe"