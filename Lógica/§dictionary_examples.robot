*** Settings ***


*** Variables ***
&{DICIONARIO_DE_LIVROS}    a1b1=as estrelas    a2b2=era uma vez    a3b3=miterios

*** Test Cases ***
Dictionary Examples
    Log To Console    ${DICIONARIO_DE_LIVROS.a2b2}

    FOR    ${livro}    IN    &{DICIONARIO_DE_LIVROS}
        Log To Console    ${livro}
    END