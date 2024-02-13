*** Settings ***
Library    String
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

&{TELA_INICIAL}
...     greet=xpath://div[@class="sc-eqUAAy PLHUq"]//span
...     sair=xpath://span[text()='Sair']
...     modal_confirmar=//button[@class="botao-default btn btn-var(--verde-primario)"]
...     scf=//div[@title="Sistema de Competência"]

&{HOME}
...    button_competencia=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Competência')]
...    button_servico=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Serviço')]
...    button_empresa=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Empresa')]

&{COMPETENCIA}
...    button_cadastrar_competencia=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Cadastrar Competência')]

&{CADASTRO_COMPETENCIA}
...    competencia=//input[@placeholder="Nome da Competência"]
...    descricao=xpath://textarea[@placeholder="Descrição da Competência"]
...    button_confirmar_cadastro=xpath://button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Confirmar Cadastro')]
...    button_confirmar=xpath://button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (text()='Confirmar')]
...    confirmacao=xpath://div[@class='Toastify__toast-body']/div[.='Competência cadastrada!']

*** Keywords ***
realizar login com ${usuario} e ${senha}
    Input Text    ${LOGIN_PAGE.email}    ${usuario}
    Input Text    ${LOGIN_PAGE.password}    ${senha}
    Click Element    ${LOGIN_PAGE.button}


realizar cadastro de competencia
    Wait Until Element Is Visible    ${TELA_INICIAL.scf}
    Click Element    ${TELA_INICIAL.scf}
    Wait Until Element Is Visible    ${HOME.button_competencia}
    Click Element    ${HOME.button_competencia}
    Wait Until Element Is Visible    ${COMPETENCIA.button_cadastrar_competencia}
    Click Element    ${COMPETENCIA.button_cadastrar_competencia}
    Wait Until Element Is Visible    ${CADASTRO_COMPETENCIA.competencia}
    ${textoAleatorio}    Generate Random String    10
    Input Text    ${CADASTRO_COMPETENCIA.competencia}    ${textoAleatorio}
    Input Text    ${CADASTRO_COMPETENCIA.descricao}    ${textoAleatorio}
    Wait Until Element Is Visible    ${CADASTRO_COMPETENCIA.button_confirmar_cadastro}
    Click Element    ${CADASTRO_COMPETENCIA.button_confirmar_cadastro}
    Wait Until Element Is Visible    ${CADASTRO_COMPETENCIA.button_confirmar}
    Click Element    ${CADASTRO_COMPETENCIA.button_confirmar}

Verificar se fez cadastro com sucesso
    Wait Until Element Is Visible    ${CADASTRO_COMPETENCIA.confirmacao}
    ${compara}    Get Text    ${CADASTRO_COMPETENCIA.confirmacao}
    Should Contain    ${compara}     Competência cadastrada!


*** Test Cases ***

teste cadastrar competência como gestor
    realizar login com ${GESTOR_VALIDO} e ${SENHA_VALIDO}
    realizar cadastro de competencia
    Verificar se fez cadastro com sucesso

teste login valido colaborador
    realizar login com ${COLABORADOR_VALIDO} e ${SENHA_VALIDO}
    realizar cadastro de competencia
    Verificar se fez cadastro com sucesso