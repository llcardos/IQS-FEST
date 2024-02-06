*** Settings ***


*** Variables ***
${NOME}            Breno
${IDADE}           ${20}
${PESO}            80
${ALTURA}          1.80
${ESTADO_CIVIL}    Solteiro

*** Test Cases ***
Variables Example
    ${IDADE}    Evaluate    ${IDADE} + ${1}
    ${PESO}    Set Variable    70
    Log To Console    \nNome: ${NOME} \nIdade: ${IDADE} \nPeso: ${PESO} \nAltura: ${ALTURA} \nEstado Civil: ${ESTADO_CIVIL}