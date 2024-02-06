*** Settings ***


*** Variables ***
${largura}        ${10}
${comprimento}    ${5}


*** Test Cases ***
Exercício 8
    ${area}    Evaluate    ${largura} * ${comprimento}
    ${preco}    Evaluate    ${area} * 2

    Log To Console    \nÁrea: ${area}
    Log To Console    Preço: ${preco}