*** Settings ***
Documentation   This is test suite of ProjectAgileWeb7 webpage Registration part
Resource        ../Tests/Resources/WEB7-18-keywords.robot
Library         SeleniumLibrary
Test Setup      Open Browser To Start Page
Test Teardown   End Web Test


*** Variables ***
${BROWSER} =  chrome
${URL} =     https://localhost:44364/


*** Test Cases ***
Verification of Home page
    [Documentation]                     Test to verify that Home page is displayed and registration and login button is present
    [Tags]                              Test WEb7-83
    Welcome message
    Displayed registration
    Displayed login


Valid Registration
    [Documentation]                     Test to verify that registration page with valid email id and valid password
    [Tags]                              Test WEB7-37 and WEB7-131
    Goto register
    Input valid emailid                 dhanyaeuro@gmail.com
    Input password                      Pqrs123$
    Input confirm password              Pqrs123$
    Submit register
    Welcome user
    Goto registration form
    Goto Profile details
    Verify displayed user email
    Enter mobile number
    Enter first name
    Enter last name
    Enter Address
    Enter postcode
    Enter city
    Enter Country
    Save details
    Verify entered details


Registration with Invalid data
     [Documentation]                    Test to verify that registration with invalid user name and invalid password
    ...                                 is not able to create a user and verifying that is it showing proper error message
    [Tags]                              Test WEB7-128
    Goto register
    Input invalid emailid               abcd
    Input invalid password              abcd
    Verify confirm password             abcdefg                             abcd
    Goto register
    Register with empty email           ${EMPTY}                            abcdefg
    Goto register
    Register with empty password        dhanyaeuro@gmail.com                abcdefg
    Goto register
    Register with empty confirm password        dhanyaeuro@gmail.com        abcdefg


Change Password with valid data
    [Documentation]                     Test to verify that registrered user is able to change current password to new password in user profile
    [Tags]                              Test WEB7-135
    Goto Login
    Login with valid deatils            dhanyaeuro@gmail.com                Pqrs123$
    Goto registration form
    Goto password
    Change password                     Pqrs123$                            Abcd123$
    Verify change password              dhanyaeuro@gmail.com                Abcd123$


Change Password with invalid data
    [Documentation]                     Test to verify that registrered user is able to change current password to new password
    ...                                 by entering invalid current password and invalid new password and confirm with invalid password
    [Tags]                              Test WEB7-135.1
    Goto Login
    Login with new password            dhanyaeuro@gmail.com               Abcd123$
    Goto registration form
    Goto password
    Verify invalid current password
    Goto password
    Verify invalid confirm password
    Goto password
    Verify invalid new password


Verify Register as a new user link
    [Documentation]                     Test to verify that 'verify as a new user link' in login should be redirecting to the registration page
    [Tags]                              Test WEB7-42
    Goto Login
    Verify new user link








