Feature: Create Skill
  As an admin
  I want to be able to add a skill to the database,
  so that students can select the skills they have

  Scenario: Admin goes to skills page
    When I go to the skills page
    Then I click the button create skill
    Then I should see the create skill page

  Scenario: Admin creates a skill
    When I go to the create skill page
    And I fill in "skill_name" with "Android"
    And I fill in "skill_description" with "Building Android Apps"
    And I press "submit_skill"
#    Then I should see "successfully"
    And I should see "Android"
    And I should see "Building Android Apps"
    And I should be on the skills page