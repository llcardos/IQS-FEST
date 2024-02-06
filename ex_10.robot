*** Settings ***


*** Variables ***
${HORA}     ${18}
${MINUTO}   ${45}
${SEGUNDO}  ${27}

*** Test Cases ***
Exercício 10
    ${resultado}    Set Variable    ${HORA}:${MINUTO}:${SEGUNDO}

    Log To Console    \nA hora é: ${resultado}
