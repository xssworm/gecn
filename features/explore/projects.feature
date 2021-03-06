@public
Feature: Explore Projects
  Background:
    Given public project "Community"
    And internal project "Internal"
    And private project "Enterprise"

  Scenario: I visit public area
    Given archived project "Archive"
    When I visit the public projects area
    Then I should see project "Community"
    And I should not see project "Internal"
    And I should not see project "Enterprise"
    And I should not see project "Archive"

  Scenario: I visit public project page
    When I visit project "Community" page
    Then I should see project "Community" home page

  Scenario: I visit internal project page
    When I visit project "Internal" page
    Then I should be redirected to sign in page

  Scenario: I visit private project page
    When I visit project "Enterprise" page
    Then I should be redirected to sign in page

  Scenario: I visit an empty public project page
    Given public empty project "Empty Public Project"
    When I visit empty project page
    Then I should see empty public project details
    And I should see empty public project details with http clone info

  Scenario: I visit an empty public project page as user with no ssh-keys
    Given I sign in as a user
    And I have no ssh keys
    And public empty project "Empty Public Project"
    When I visit empty project page
    Then I should see empty public project details
    And I should see empty public project details with http clone info

  Scenario: I visit an empty public project page as user with an ssh-key
    Given I sign in as a user
    And I have an ssh key
    And public empty project "Empty Public Project"
    When I visit empty project page
    Then I should see empty public project details
    And I should see empty public project details with ssh clone info

  Scenario: I visit public area as user
    Given archived project "Archive"
    And I sign in as a user
    When I visit the public projects area
    Then I should see project "Community"
    And I should see project "Internal"
    And I should not see project "Enterprise"
    And I should not see project "Archive"

  Scenario: I visit internal project page as user
    Given I sign in as a user
    When I visit project "Internal" page
    Then I should see project "Internal" home page

  Scenario: I visit public project page
    When I visit project "Community" page
    Then I should see project "Community" home page
    And I should see an http link to the repository

  Scenario: I visit public project page as user with no ssh-keys
    Given I sign in as a user
    And I have no ssh keys
    When I visit project "Community" page
    Then I should see project "Community" home page
    And I should see an http link to the repository

  Scenario: I visit public project page as user with an ssh-key
    Given I sign in as a user
    And I have an ssh key
    When I visit project "Community" page
    Then I should see project "Community" home page
    And I should see an ssh link to the repository

  Scenario: I visit an empty public project page
    Given public empty project "Empty Public Project"
    When I visit empty project page
    Then I should see empty public project details

  Scenario: I visit public project issues page as a non authorized user
    Given I visit project "Community" page
    Then I should not see command line instructions
    And I visit "Community" issues page
    Then I should see list of issues for "Community" project

  Scenario: I visit public project issues page as authorized user
    Given I sign in as a user
    Given I visit project "Community" page
    And I visit "Community" issues page
    Then I should see list of issues for "Community" project

  Scenario: I visit internal project issues page as authorized user
    Given I sign in as a user
    Given I visit project "Internal" page
    And I visit "Internal" issues page
    Then I should see list of issues for "Internal" project

  Scenario: I visit public project merge requests page as an authorized user
    Given I sign in as a user
    Given I visit project "Community" page
    And I visit "Community" merge requests page
    And project "Community" has "Bug fix" open merge request
    Then I should see list of merge requests for "Community" project

  Scenario: I visit public project merge requests page as a non authorized user
    Given I visit project "Community" page
    And I visit "Community" merge requests page
    And project "Community" has "Bug fix" open merge request
    Then I should see list of merge requests for "Community" project

  Scenario: I visit internal project merge requests page as an authorized user
    Given I sign in as a user
    Given I visit project "Internal" page
    And I visit "Internal" merge requests page
    And project "Internal" has "Feature implemented" open merge request
    Then I should see list of merge requests for "Internal" project

  Scenario: Trending page
    Given archived project "Archive"
    And project "Archive" has comments
    And I sign in as a user
    And project "Community" has comments
    And trending projects are refreshed
    When I visit the explore trending projects
    Then I should see project "Community"
    And I should not see project "Internal"
    And I should not see project "Enterprise"
    And I should not see project "Archive"

  Scenario: Most starred page
    Given archived project "Archive"
    And I sign in as a user
    When I visit the explore starred projects
    Then I should see project "Community"
    And I should see project "Internal"
    And I should not see project "Archive"
