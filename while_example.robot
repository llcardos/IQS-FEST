*** Settings ***


*** Variables ***
${NUMERO_LOUCAS}    ${5}

*** Test Cases ***
Lava Louças
    WHILE  ${NUMERO_LOUCAS} > 0
        Log To Console  \nUma louça foi lavada
        ${NUMERO_LOUCAS}    Evaluate    ${NUMERO_LOUCAS} - 1
        IF  ${NUMERO_LOUCAS} == 0
            Log To Console    Acabaram as louças! Parabéns!
        ELSE
            Log To Console    \nRestam ${NUMERO_LOUCAS} louças
        END
    END