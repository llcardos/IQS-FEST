*** Settings ***


*** Variables ***
${NUMERO1}    ${-10}
${NUMERO2}    ${45}

*** Test Cases ***
Exercício 14
    ${resultado1}    Evaluate    ${NUMERO1} + ${NUMERO2}
        Log To Console    \nOperação de adição entre ${NUMERO1} e ${NUMERO2} = ${resultado1}

    ${resultado2}    Evaluate    ${NUMERO1} - ${NUMERO2}
        Log To Console    \nOperação de subtração entre ${NUMERO1} e ${NUMERO2} = ${resultado2}

    ${resultado3}    Evaluate    ${NUMERO1} * ${NUMERO2}
        Log To Console    \nOperação de multiplicação entre ${NUMERO1} e ${NUMERO2} = ${resultado3}

    ${resultado4}    Evaluate    ${NUMERO1} / ${NUMERO2}
        Log To Console    \nOperação de divisão entre ${NUMERO1} e ${NUMERO2} = ${resultado4}