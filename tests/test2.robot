*** Settings ***

Library     SeleniumLibrary
Library     customKeywords.py

Documentation  To validate the Login form
Test Setup      open the browser with the mortgage payment url
Test Teardown       Close Browser Session
Resource            resource.robot

*** Variables ***

${error_message_login}      css:.alert-danger
${shop_page_load}           css:.nav-link

*** Test Cases ***
Validate Unsuccessful Login
#    open the browser with the mortgage payment url
    Fill the login form             ${username}     ${invalid_password}
    wait until elements located in the page     ${error_message_login}
    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login form     ${username}     ${valid_password}
    wait until elements located in the page     ${shop_page_load}
    verify card titles in the shop page
    Select the card         blackbery

*** Keywords ***

Fill the login form
    [arguments]     ${username}   ${password}
    input text     id:username    ${username}
    input text     id:password    ${password}
    click button   id:signInBtn

#wait until its checks and display error message
#    wait until element is visible   ${error_message_login}

wait until elements located in the page
    [arguments]     ${elements}
    wait until element is visible   ${elements}

verify error message is correct
    ${errormessage}=      get text   ${error_message_login}
    should be equal as strings      ${errormessage}     Incorrect username/password.

verify card titles in the shop page
       @{created_list}=   create list     iphone X    Samsung Note 8      Nokia Edge      Blackberry
       ${list_elements}=    Get WebElements      css:.card-title
       @{acutal_list}=    create list
       FOR  ${element}   IN     @{list_elements}
          log to console      ${element.text}
#          Append To List       ${actual_list}      ${element.text}
       END
#       Lists Should be Equal    ${created_list}     ${acutal_list}

Select the card
       [arguments]          ${cardName}
       ${list_elements} =    Get WebElements      css:.card-title
       ${index}=     set variable   1
       FOR  ${elements}   IN    @{list_elements}
#            ${text}=    get text    ${elements}
          Exit For Loop If    '${cardName}' == '${elements.text}'
           ${index}=   evaluate   ${index} + 1
       END
       sleep        3
       click button     xpath:(//*[@class='card-footer'])[${index}]/button

Fill the login deta
