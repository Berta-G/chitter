Feature: User can Log out

Background: 
	Given the user "Pepe" exists
	
Scenario: User logs out
	Given user "Pepe" is logged in
	Then I should see "Logged in as: Pepe"
	When I press "Log out" 
	Then I should see "Goodbye"
	And I should not see "Logged in as: Pepe"