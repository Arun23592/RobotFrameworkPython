*** Settings ***

Library     SeleniumLibrary

Documentation  To validate the Login form
Test Teardown       close browser
*** Variables ***
${error_message_login}      css:.alert-danger


*** Test Cases ***
Validate Unsuccessful Login
    open the browser with the mortgage payment url
    Select the link of child window
    Verify the user is switched to child window
    Grab the email id in the child window
#    Switch to parent window and enter the email


*** keywords ***
open the browser with the mortgage payment url
    open browser  https://rahulshettyacademy.com/loginpagePractise/     browser=chrome
    maximize browser window
    input text     id:username      rahulshettyacademy
    input text     id:password      learning
    click button   id:signInBtn

Select the link of child window
    click element       css:.blinkingText
    sleep               5

Verify the user is switched to child window
    switch window       NEW
    element text should be      css:h1      DOCUMENTS REQUEST

Grab the email id in the child window
    ${text}=     get text        css:.red
    switch window       MAIN



