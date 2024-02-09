*** Settings ***
#a partir de um número retorne como resposta se ele é positivo NEAGTIVO ou zero

*** Variables ***
${NUMERO1}    ${-10}
${NUMERO2}    ${0}
${NUMERO3}    ${-10}
${NUMERO4}    ${485}
${NUMERO5}    ${-1845}
${NUMERO6}    ${0.0}


*** Test Cases ***
Exercício 11

    IF    ${NUMERO1} > 0
        Log To Console    \n${NUMERO1} É positivo
    ELSE IF    ${NUMERO1} == 0
        Log To Console    \n${NUMERO1} É zero
    ELSE IF    ${NUMERO1} < 0
        Log To Console    \n${NUMERO1} é negativo
    END

    IF    ${NUMERO2} > 0
        Log To Console    \n${NUMERO2} É positivo
    ELSE IF    ${NUMERO2} == 0
        Log To Console    \n${NUMERO2} É zero
    ELSE IF    ${NUMERO2} < 0
        Log To Console    \n${NUMERO2} é negativo
    END

    IF    ${NUMERO3} > 0
        Log To Console    \n${NUMERO3} É positivo
    ELSE IF    ${NUMERO3} == 0
        Log To Console    \n${NUMERO3} É zero
    ELSE IF    ${NUMERO3} < 0
        Log To Console    \n${NUMERO3} é negativo
    END    

    IF    ${NUMERO4} > 0
        Log To Console    \n${NUMERO4} É positivo
    ELSE IF    ${NUMERO4} == 0
        Log To Console    \n${NUMERO4} É zero
    ELSE IF    ${NUMERO4} < 0
        Log To Console    \n${NUMERO4} é negativo
    END
    
    IF    ${NUMERO5} > 0
        Log To Console    \n${NUMERO5} É positivo
    ELSE IF    ${NUMERO5} == 0
        Log To Console    \n${NUMERO5} É zero
    ELSE IF    ${NUMERO5} < 0
        Log To Console    \n${NUMERO5} é negativo
    END
    
    IF    ${NUMERO6} > 0
        Log To Console    \n${NUMERO6} É positivo
    ELSE IF    ${NUMERO6} == 0
        Log To Console    \n${NUMERO6} É zero
    ELSE IF    ${NUMERO6} < 0
        Log To Console    \n${NUMERO6} é negativo
    END