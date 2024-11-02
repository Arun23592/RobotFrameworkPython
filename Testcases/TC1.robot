*** Settings ***
Library     RequestsLibrary


*** variables ***
${cur_dir}     https://gorest.co.in


*** Test Cases ***
Quick Get Request Test
    Create Session  mySession   ${cur_dir}
    ${response}=    get request  mySession  /public/v2/users
    log to console  ${response.status_code}