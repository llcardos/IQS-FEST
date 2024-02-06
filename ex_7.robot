*** Settings ***


*** Variables ***
${DIVIDENDO}        ${10}
${DIVISOR}          ${5}


*** Test Cases ***
Exercício 7
    ${quociente}    Evaluate    ${DIVIDENDO} / ${DIVISOR}
    ${resto}        Evaluate    ${DIVIDENDO} % ${DIVISOR}

    Log To console    \nDividendo: ${DIVIDENDO}
    Log To Console    Divisor: ${DIVISOR}
    Log To Console    Quociente: ${quociente}
    Log To COnsole    Resto: ${resto}