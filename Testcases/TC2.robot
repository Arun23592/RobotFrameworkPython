*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_url}     https://gorest.co.in


*** Test Cases ***
Verify Get Request
     Create Session  mySession   ${base_url}
    ${response}=    get request  mySession  /public/v2/users
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    ${Status_code}=         convert to string      ${response.status_code}
    should be equal         ${status_code}          200

    ${content}=         convert to string           ${response.content}
    should contain      ${content}                  Trilokesh Naik