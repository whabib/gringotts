Feature: Opted-in User Needs to Verify
  In order to protect a user's account
  A user who has opted-in to Gringotts 2FA
  Must verify using 2FA in order to function as their logged in account
  
  Scenario: Opted-in user logging in from unknown device is required to authenticate
    Given I am opted-in
      But I am not logged in
    When I sign in with valid credentials
    Then I should see the verify page
  
  Scenario: Opted-in user tries to navigate away to a protected page is redirected back
    Given I am opted-in
      But I am not logged in
    When I sign in with valid credentials
    Then I should see the verify page
    When I navigate to a protected page
    Then I should see the verify page
  
  Scenario: Opted-in user tries to navigate away to an un-protected page is redirected back
    Given I am opted-in
      But I am not logged in
    When I sign in with valid credentials
    Then I should see the verify page
    When I navigate to an un-protected page
    Then I should see the verify page
    
  Scenario: Opted-in user logging in from known device is not required to verify
    Given I am opted-in
      And I am verified
      But I am not logged in
    When I sign in with valid credentials
    Then I should not see the verify page
    
  Scenario: Opted-in user who verifies is not bothered anymore
    Given I am opted-in
      And I am verified
    When I navigate to a protected page
    Then I should not see the verify page
