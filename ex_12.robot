*** Settings ***


*** Variables ***
${NOTA1}           ${7}
${NOTA2}           ${9}
${NOTA3}           ${7}
${NOTA4}           ${5}

*** Test Cases ***
Exercício 12
    ${media}    Evaluate    (${NOTA1} + ${NOTA2} + ${NOTA3} + ${NOTA4}) / 4

    Log To Console    \nMedia: ${media}

    IF    ${media} >= 7
        Log To Console    \nAprovado
    ELSE
        Log To Console    \nReprovado
    END