*** Settings ***
Library    String
Library    SeleniumLibrary
Test Setup    Run Keywords
...    Open Browser    url=${URL_LOGIN}    AND
...    Maximize Browser Window

Test Teardown    Close Browser

*** Variables ***
${URL_LOGIN}    http://sistemas.t2mlab.com:3006/home

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
...     scf=//div[@title="Sistema de Competência"]

&{HOME}
...    button_colaborador=xpath://button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Colaborador')]


&{BUSCAR_COLABORADOR}
...    filtro_colaborador=//input[@class='form-control']
...    voltar=//button[@class='botao-default btn btn-var(--cinza-primario)']

*** Keywords ***
realizar login com ${usuario} e ${senha}
    Input Text    ${LOGIN_PAGE.email}    ${usuario}
    Input Text    ${LOGIN_PAGE.password}    ${senha}
    Click Element    ${LOGIN_PAGE.button}


realizar busca de colaborador
    Wait Until Element Is Visible    ${TELA_INICIAL.scf}
    Click Element    ${TELA_INICIAL.scf}
    Wait Until Element Is Visible    ${HOME.button_colaborador}
    Click Element    ${HOME.button_colaborador}
    Wait Until Element Is Visible    ${BUSCAR_colaborador.filtro_colaborador}
    Click Element    ${BUSCAR_COLABORADOR.filtro_colaborador}
    Input Text    ${BUSCAR_COLABORADOR.filtro_colaborador}    gestor
    Wait Until Element Is Visible    ${BUSCAR_COLABORADOR.voltar}
    Click Element    ${BUSCAR_COLABORADOR.voltar}

*** Test Cases ***

teste cadastrar competência como gestor
    realizar login com ${GESTOR_VALIDO} e ${SENHA_VALIDO}
    realizar busca de colaborador

teste cadastrar competência como colaborador
    realizar login com ${COLABORADOR_VALIDO} e ${SENHA_VALIDO}
    realizar busca de colaborador