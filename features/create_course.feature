Feature: Admin create course
  
  As an admin
  So that I can manage groups of students and projects
  I want to create a course

#happy paths
Scenario: Admin clicks on create a course link
  Given I have an account with name "User One" and email "admin@admin.com" and password "password"
  Given I am logged in as "admin@admin.com" with "password"
  When I am on the courses page
  And I press "Create Course"
  Then I should be on the new course page
  And I should see "Course Name"
  And I should see "Code"
  And I should see "Name"
  
Scenario: Admin creates a course
  Given I have an account with name "User One" and email "admin@admin.com" and password "password"
  Given I am logged in as "admin@admin.com" with "password"
  When I am on the new course page
  And I fill in "course_name" with "any name"
  And I fill in "course_code" with "any code"
  And I fill in "course_description" with "any description"
  And I fill in "section_number" with "300"
  And I press "Create Course"
  Then I should see "successfully"
  And I should see "any name"
  And I should see "any code"
  And I should see "any description"
  And I should see "300"
  And I should be on the courses page

#sad paths
Scenario: Admin create a course without code
  Given I have an account with name "Admin" and email "admin@admin.com" and password "password"
  And I am logged in as "admin@admin.com" with "password"
  When I am on the new course page
  And I fill in "course_name" with "any name"
  And I fill in "course_description" with "any description"
  And I fill in "section_number" with "300"
  And I press "Create Course"
  Then I should see "Code can't be blank"
  
Scenario: Admin create a course without name
  Given I have an account with name "Admin" and email "admin@admin.com" and password "password"
  And I am logged in as "admin@admin.com" with "password"
  When I am on the new course page
  And I fill in "course_code" with "any code"
  And I fill in "course_description" with "any description"
  And I fill in "section_number" with "300"
  And I press "Create Course"
  Then I should see "Name can't be blank"
  
Scenario: Admin create a course without description
  Given I have an account with name "Admin" and email "admin@admin.com" and password "password"
  And I am logged in as "admin@admin.com" with "password"
  When I am on the new course page
  And I fill in "course_name" with "any name"
  And I fill in "course_code" with "any code"
  And I fill in "section_number" with "300"
  And I press "Create Course"
  Then I should see "Description can't be blank"
  
Scenario: Admin create a course without a section
  Given I have an account with name "Admin" and email "admin@admin.com" and password "password"
  And I am logged in as "admin@admin.com" with "password"
  When I am on the new course page  
  And I fill in "course_name" with "any name"
  And I fill in "course_code" with "any code"
  And I fill in "course_description" with "any description"
  And I press "Create Course"
  Then I should see "Number is not a number"
  
Scenario: Admin create a course with a bad section
  Given I have an account with name "Admin" and email "admin@admin.com" and password "password"
  And I am logged in as "admin@admin.com" with "password"
  When I am on the new course page  
  And I fill in "course_name" with "any name"
  And I fill in "course_code" with "any code"
  And I fill in "course_description" with "any description"
  And I fill in "section_number" with "-1"
  And I press "Create Course"
  Then I should see "Number is not included in the list"
  
Scenario: Admin creates a course without a repeated code
  Given I have an account with name "Admin" and email "admin@admin.com" and password "password"
  And I am logged in as "admin@admin.com" with "password"
  And I have a course with name "Anything" and code "this" and description "Anything" and sections "501 502"
  When I create a course with name "Anything" and code "this" and description "Anything" and section "503"
  Then I should see "Code has already been taken"