*** Settings ***


*** Variables ***
${NOME}            Maria
${IDADE}           ${22}
${CONDICAO}        

*** Test Cases ***
Exercício 15
    
    IF    ${IDADE} > 65
        Log To Console    \nOlá ${NOME} sua fila é Preferêncial!
    ELSE IF    "${CONDICAO}" == "deficiente físico"
        Log To Console    \nOlá ${NOME} sua fila é Preferêncial!
    ELSE IF    "${CONDICAO}" == "gestante"
        Log To Console    \nOlá ${NOME} sua fila é Preferêncial!
    ELSE IF    "${CONDICAO}" == ""
        Log To Console    \nOlá ${NOME}, sua fila é Comum!
    ELSE
        Log To Console    \nOlá ${NOME} sua fila é Comum!
    END