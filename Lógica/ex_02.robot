*** Settings ***


*** Variables ***
${ANTECESSOR}           ${8}
${SUCESSOR}           ${8}


*** Test Cases ***
Exercício 2
    ${ANTECESSOR}    Evaluate    ${ANTECESSOR} - ${1}
    Log to Console    \nAntecessor: ${ANTECESSOR}
    
    ${SUCESSOR}    Evaluate    ${SUCESSOR} + ${1}
    Log to Console    \nSucessor: ${SUCESSOR}