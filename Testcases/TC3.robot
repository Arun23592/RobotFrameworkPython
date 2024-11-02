*** Settings ***
Library     RequestsLibrary
Library         RequestsLibrary
Library         Collections
*** Variables ***
${base_url}     https://gorest.co.in


*** Test Cases ***
Verify Post Request
     post on session    mySessions   ${base_url}
     ${body}        create dictionary   name=Arun Subramani         gender= male    email=arun@gmail.com    status=active
    ${headers}      create dictionary   content-type=application/json       Authorization=Bearer 7232003c821bc49a0bd5c56d7df39c5289168e323fb17c5289168e323fb17c5b6b1597d8941e33ef
    ${response}=    post request    mySession  /public/v2/users     headers=${headers}      data=${body}
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    ${Status_code}=         convert to string      ${response.status_code}
    should be equal         ${status_code}          201
