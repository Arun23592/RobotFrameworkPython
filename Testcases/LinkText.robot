*** Settings ***
Library         SeleniumLibrary
Library         Collections

*** Test Cases ***
Login with correct username and password
    open browser  url=https://the-internet.herokuapp.com/login      browser=chrome
    maximize browser window
    sleep  2
    input text  username    tomsmith
    input text  password    SuperSecretPassword!
    click button    class:radius
    get text  id=flash
    element should contain  id=flash    You logged into a secure area!
    sleep  3
    click link    Logout
    close browser

Verify all the linktext
    open browser  url=https://demo.guru99.com/test/newtours/    browser=chrome
    maximize browser window
    sleep  3
    ${count}   get element count  xpath://a
    log to console  ${count}

    FOR    ${element}   IN RANGE    1   ${count}
        ${linkText}=       get text  xpath:(//a)[${element}]
#        click link  ${linkText}
#        go back
        log to console  ${linkText}
    END

