*** Settings ***


*** Variables ***
${NOME}            Lucas
${DISCIPLINA}      Lógica de Programação
${NOTA1}           ${7}
${NOTA2}           ${9}
${NOTA3}           ${7}
${NOTA4}           ${5}
${NOTA5}           ${4}
*** Test Cases ***
Exercício 3
    ${media}    Evaluate    (${NOTA1} + ${NOTA2} + ${NOTA3} + ${NOTA4}) / ${NOTA5}

    Log To Console    \nNome: ${NOME}  
    Log To Console    Disciplina: ${DISCIPLINA}  
    Log To Console    Media: ${media}