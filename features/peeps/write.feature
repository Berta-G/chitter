Feature: Writting peeps

Scenario: A logged in user can write a peep
	Given the user "Pepe" exists
	And user "Pepe" is logged in
	When I am on the homepage
	And I fill in "peep_text" with "This is my peep"
	And I fill in "peep_title" with "Title"
	And I press "Peep"
	Then the peep "Title" is created

Scenario: A user cannot write a post if not logged
	When I am on the homepage
	Then I should not see "Your Peep"

