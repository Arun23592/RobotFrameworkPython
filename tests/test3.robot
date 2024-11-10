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



*** Keywords ***
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
    @{words}=    Split String       ${text}        at
#    switch window       MAIN

    ${text_split}=       Get From List      ${words}    1
    log     ${text_split}
    @{words_2}=   Split String        ${text_split}
    ${email}=     Get From List       @{words_2}        0

Switch to parent window and enter email
    switch window



