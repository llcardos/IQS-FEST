*** Settings ***


*** Variables ***
${NUMERO1}    ${25}
${NUMERO2}    ${48651}

*** Test Cases ***
Exercício 13
    
    IF    ${NUMERO1} > ${NUMERO2}
        Log To Console    \nO número ${NUMERO1} é maior que o número ${NUMERO2}.
    ELSE IF    ${NUMERO2} > ${NUMERO1}
        Log To Console    \nO número ${NUMERO2} é maior que o número ${NUMERO1}.
    END