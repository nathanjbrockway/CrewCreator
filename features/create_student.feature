Feature: Create Student
  
  As a user,
  I want to be able make a student account
  So that I can join courses and work on teams
  
  Scenario: User FAILS to make a student account
    Given I am not logged in
    And I am on the create account page
    When I fill in "student_name" with "Joe Small"
    And I fill in "student_email" with "bademail"
    And I fill in "student_password" with "password1!"
    And I fill in "student_password_confirmation" with "password1!"
    And press "Create Account"
    Then I am on the create account page
    And I should see "Create Student Account"
    
  Scenario: User makes a student account
    Given I am not logged in
    And I am on the create account page
    When I fill in "student_name" with "Joe Small"
    And I fill in "student_email" with "new@email.com"
    And I fill in "student_password" with "password1!"
    And I fill in "student_password_confirmation" with "password1!"
    And press "Create Account"
    Then I should be on the home page
    And I should see "new@email.com"
    
  Scenario: Student with account logs in
    Given I have a student account
    And I am logged in as "student@email.com" with "password1!"
    When I am on the course page
    Then I should see "student@email.com"
    And I should not see "Options"