Feature: List Peeps

Background:
	Given the user "Pepe" exists
	And user "Pepe" is logged in
	
Scenario: List all the peeps
	Given some peeps are created
	When I am on the homepage
	Then I should see "Title 1"
	And I should see "Title 2"
