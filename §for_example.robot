*** Settings ***


*** Variables ***
${NUMERO_LOUCAS}    ${5}

*** Test Cases ***
For Example
    FOR    ${i}   IN RANGE    ${NUMERO_LOUCAS}
        Log To Console    Uma louça foi lavada!
        ${remaining}    Evaluate    ${NUMERO_LOUCAS} - ${i} - 1
        Log To Console    Restam ${remaining} louças
    END