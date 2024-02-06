*** Settings ***


*** Variables ***
${ANO_NASCIMENTO}    ${1997}
${ANO_FUTURO}        ${2035}

*** Test Cases ***
Exercício 4
    ${resultado}    Set Variable     ${${ANO_FUTURO} - ${ANO_NASCIMENTO}}

    Log To Console    \nMinha idade em 2035 será: ${resultado} anos.