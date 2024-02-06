*** Settings ***


*** Variables ***
${HORAS_NORMAIS}        ${1998}
${HORAS_EXTRAS}         ${530}

*** Test Cases ***
Exercício 5
    ${resultado}    Evaluate    (${HORAS_NORMAIS} * 10) + (${HORAS_EXTRAS} * 15)

    Log To Console    \nSeu salário anual é de: ${resultado} reais.