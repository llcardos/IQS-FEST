*** Settings ***


*** Variables ***
${NUMERO1}           ${45120}
${NUMERO2}           ${8}  

*** Test Cases ***
Exercício 1
    ${resultado}    Set Variable     ${${NUMERO1} + ${NUMERO2}}
    Log To Console    \nSoma: ${${NUMERO1} + ${NUMERO2}}

#*** Settings ***


#*** Variables ***


#*** Test Cases ***
#Exercício