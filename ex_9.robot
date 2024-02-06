*** Settings ***


*** Variables ***

${distancia}           ${100}
${gastos}              ${35}

*** Test Cases ***
Exercício 9
    ${consumo}    Set Variable     ${${distancia} / ${gastos}}

    Log To Console    \nConsumo médio: ${${consumo}}