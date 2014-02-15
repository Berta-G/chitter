Feature: A user can sign up to the service

Background:
	Given I am on the sign up page

Scenario: A user signs up with correct data
	When I fill in the following:
  	| email 									| example@mail.com 	|
   	| password    						| 123456 						|
   	| password_confirmation  	| 123456 						|
	 	| name          					| Jose   						|
	 	| username   							| Pepe            	|
	And I press "Sign up"
	Then user "example@mail.com" is created 
	And I should see "Welcome to chitter, Pepe"


Scenario: Password does not match password_confirmation
	When I fill in the following:
  	| email 									| example@mail.com 	|
   	| password    						| 123456 						|
   	| password_confirmation  	| 123455 						|
	 	| name          					| Jose   						|
	 	| username   							| Pepe            	|
	And I press "Sign up"
	Then user "example@mailcom" is not created
	And I should see "Password does not match the confirmation"

Scenario: Fields not populated:
	When I fill in the following:
  	| email 									| example@mail.com 	|
   	| password    						| 123456 						|
   	| password_confirmation  	| 123456 						|
	 	| name          					|   								|
	 	| username   							|             			|
	And I press "Sign up"
	Then user "example@mailcom" is not created
	And I should see "Name must not be blank"
	And I should see "Username must not be blank"

Scenario: username already exists:
	Given the user "Pepe" exists
	When I fill in the following:
	 	| email 									| newmail@mail.com 	|
   	| password    						| ABCDE 						|
   	| password_confirmation  	| ABCDE 						|
	 	| name          					| Luis		   				|
	 	| username   							| Pepe            	|
	And I press "Sign up"
	Then user "newmail@mail.com" is not created
	And I should see "Username is already taken"
