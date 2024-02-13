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
...    button_competencia=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Competência')]

&{COMPETENCIA}
...    button_buscar_competencia=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Buscar Competência')]

&{BUSCAR_COMPETENCIA}
...    filtro_competencia=//input[@class='form-control']
...    olho=//button[name()='svg']
...    voltar=//button[@class='botao-default btn btn-var(--cinza-primario)']

*** Keywords ***
realizar login com ${usuario} e ${senha}
    Input Text    ${LOGIN_PAGE.email}    ${usuario}
    Input Text    ${LOGIN_PAGE.password}    ${senha}
    Click Element    ${LOGIN_PAGE.button}


realizar busca de competencia
    Wait Until Element Is Visible    ${TELA_INICIAL.scf}
    Click Element    ${TELA_INICIAL.scf}
    Wait Until Element Is Visible    ${HOME.button_competencia}
    Click Element    ${HOME.button_competencia}
    Wait Until Element Is Visible    ${COMPETENCIA.button_buscar_competencia}
    Click Element    ${COMPETENCIA.button_buscar_competencia}
    Wait Until Element Is Visible    ${BUSCAR_COMPETENCIA.filtro_competencia}
    Click Element    ${BUSCAR_COMPETENCIA.filtro_competencia}
    Input Text    ${BUSCAR_COMPETENCIA.filtro_competencia}    Nova Competencia
    Wait Until Element Is Visible    ${BUSCAR_COMPETENCIA.olho}
    Click Element    ${BUSCAR_COMPETENCIA.olho}
    Wait Until Element Is Visible    ${BUSCAR_COMPETENCIA.voltar}
    Click Element    ${BUSCAR_COMPETENCIA.voltar}


*** Test Cases ***

teste cadastrar competência como gestor
    realizar login com ${GESTOR_VALIDO} e ${SENHA_VALIDO}
    realizar busca de competencia

