*** Settings ***
Documentation   Login validation

Library         SeleniumLibrary

*** Variables ***
${username}             rahulshettyacademy
${valid_password}       learning
${invalid_password}     12345678
${url}                  https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
open the browser with the mortgage payment url
    open browser  https://rahulshettyacademy.com/loginpagePractise/     browser=chrome
    maximize browser window

Close Browser Session
    close browser