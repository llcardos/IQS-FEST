*** Settings ***


*** Variable ***
${NUMERO1}            ${10}
${NUMERO2}           ${5}           

*** Test Cases ***
Math Examples
    ${resultado}    Set Variable     ${${NUMERO1} + ${NUMERO2}}
    Log To Console    \nResultado(${NUMERO1} + ${NUMERO2}): ${resultado}
    Log To Console    \nSoma: ${3 + 2}
    Log To Console    Subtração: ${10 - 2}
    Log To Console    Multiplicação: ${20 * 5}
    Log To Console    Divisão: ${9 // 5}
    Log To Console    Resto: ${9 % 2}