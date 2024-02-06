*** Settings ***


*** Variables ***
${CELSIUS}    ${37}

*** Test Cases ***
Exercício 6
    ${resultado}    Evaluate    (${CELSIUS} * 1.8) + 32

    Log To Console    \nTemperatura em Fahrenheit: ${resultado}