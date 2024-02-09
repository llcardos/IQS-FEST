*** Settings ***


*** Variables ***
#posso escrever qualquer coisa
${GREETING}    Hello World!

*** Test Cases ***
Greet User
    Log To Console    \n${GREETING}