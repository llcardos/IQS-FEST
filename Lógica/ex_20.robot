*** Settings ***


*** Variables ***
${PESO}    ${120}
${ALTURA}    ${1.85}

*** Test Cases ***
Exercicio 20
    ${resultadoAltura}    Evaluate    ${ALTURA} * ${ALTURA}
    ${imc}    Evaluate    ${PESO} / ${resultadoAltura}

    Log To Console    Seu: ${imc} 

    IF  ${imc} < 18.5
        Log To Console    Abaixo do Peso Normal
    ELSE IF     ${imc} >=18.5 and ${imc} <=24.9
        Log To Console    Peso Normal
    ELSE IF    ${imc} >=25.0 and ${imc} <=29.9
        Log To Console    Excesso de Peso
    ELSE IF    ${imc} >=30.0 and ${imc} <=34.9
        Log To Console    Obesidade Classe I
    ELSE IF    ${imc} >=35.0 and ${imc} <=39.9
        Log To Console    Obesidade Classe II
    ELSE IF    ${imc} >=40.0
        Log To Console    Obesidade Classe III
    END
    
    