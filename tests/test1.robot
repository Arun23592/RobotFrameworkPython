*** Settings ***
Documentation  To validate the Login form
Library             SeleniumLibrary
Test Setup          open the browser with the mortgage payment url
Test Teardown       close browser
Resource            resoure.robot
*** Variables ***
${error_message_login}      css:.alert-danger


*** Test Cases ***
Validate child window functionality
    open the browser with the mortgage payment url
    Select the link of child window
    Verify the user is sswitched to child window
    Grab the email id in the child window
    Switch to parent window and enter the email


*** Keywords ***
open the browser with the mortgage payment url
    open browser  https://rahulshettyacademy.com/loginpagePractise/     browser=chrome
    maximize browser window
Select the link of child window
    click element       css:.blinkingText
    sleep               5

Verify the user is switched to child window
    switch window       NEW
    element text should be      css:h1      Documents request

Grab the email id in the child window
    ${text}=     get text        css:.red
