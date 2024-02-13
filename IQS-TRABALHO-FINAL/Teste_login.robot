*** Settings ***
Library    SeleniumLibrary
Test Setup    Run Keywords
...    Open Browser    url=${URL_LOGIN}    AND
...    Maximize Browser Window

Test Teardown    Close Browser

*** Variables ***
${URL_LOGIN}    http://sistemas.t2mlab.com:3006

${COLABORADOR_VALIDO}    BNViana
${GESTOR_VALIDO}    Alan
${SENHA_VALIDO}    123

&{LOGIN_PAGE}
...    email=id:formBasicEmail
...    password=id:formBasicPassword
...    button=xpath://button
...    erro_mesage=xpath://div[@role='alert']/div[2]

&{TELA_INICIAL}
...     greet=xpath://div[@class="sc-eqUAAy PLHUq"]//span
...     sair=xpath://span[text()='Sair']
...     modal_confirmar=//button[@class="botao-default btn btn-var(--verde-primario)"]



*** Keywords ***
realizar login com ${usuario} e ${senha}
    Input Text    ${LOGIN_PAGE.email}    ${usuario}
    Input Text    ${LOGIN_PAGE.password}    ${senha}
    Click Element    ${LOGIN_PAGE.button}

logout
    Wait Until Element Is Visible    ${TELA_INICIAL.sair}
    Click Element    ${TELA_INICIAL.sair}
    Wait Until Element Is Visible    ${TELA_INICIAL.modal_confirmar}
    Click Element    ${TELA_INICIAL.modal_confirmar}

Verificar se conseguiu realizar o login corretamente
    Wait Until Element Is Visible    ${TELA_INICIAL.greet}
    ${compara}    Get Text    ${TELA_INICIAL.greet}
    Should Contain    ${compara}     Bem-vindo

Verificar se não foi possivel realizar o login
    Wait Until Element Is Visible    ${LOGIN_PAGE.erro_mesage}
    ${compara}    Get Text    ${LOGIN_PAGE.erro_mesage}
    Should Be Equal    ${compara}     Erro ao realizar o login - E-mail incorreto

Verificar se fez logout
    Element Should Be Visible    ${LOGIN_PAGE.email}

*** Test Cases ***

teste login valido colaborador
    realizar login com ${COLABORADOR_VALIDO} e ${SENHA_VALIDO}
    Verificar se conseguiu realizar o login corretamente

teste login valido gestor
    realizar login com ${GESTOR_VALIDO} e ${SENHA_VALIDO}
    Verificar se conseguiu realizar o login corretamente

teste login invalido colaborador/gestor
    realizar login com dghk e ${SENHA_VALIDO}
    Verificar se não foi possivel realizar o login

teste logout de colaborador
    realizar login com ${COLABORADOR_VALIDO} e ${SENHA_VALIDO}
    logout
    Verificar se fez logout

teste logout de gestor
    realizar login com ${GESTOR_VALIDO} e ${SENHA_VALIDO}
    logout
    Verificar se fez logout