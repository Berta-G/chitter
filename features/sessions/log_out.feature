Feature: User can Log out

Background: 
	Given the user "Pepe" exists
	
Scenario: User logs out
	Given user "Pepe" is logged in
	Then I should see "Welcome to chitter, Pepe"
	When I press "Log out" 
	Then I should see "Goodbye"
	And I should not see "Welcome to chitter, Pepe"