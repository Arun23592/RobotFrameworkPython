*** Settings ***
Library     Collections
*** Test Cases ***
ForLoopTest
    FOR     ${counter}      IN RANGE     1     10
        Log     ${counter}
    END