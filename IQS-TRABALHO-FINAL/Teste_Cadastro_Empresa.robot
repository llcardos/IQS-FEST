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

&{EMPRESA}
...    button_cadastrar_empresa=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Cadastrar Empresa')]

&{CADASTRAR_EMPRESA}
...    nome=//input[@placeholder="Empresa A"]
...    cnpj=//input[@placeholder="00.000.000/0000-00"]
...    numero=//input[@placeholder="(99)99999-9999"]
...    setor=//input[@placeholder="Setor de atuação"]
...    endereco=xpath://textarea[@placeholder="Rua..."]
...    button_confirmar_cadastro=xpath://button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Confirmar')]
...    button_confirmar=xpath://button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (text()='Confirmar')]
...    confirmacao=xpath://div[@class='Toastify__toast-body']/div[.='Empresa cadastrada com sucesso!']

*** Keywords ***
realizar login com ${usuario} e ${senha}
    Input Text    ${LOGIN_PAGE.email}    ${usuario}
    Input Text    ${LOGIN_PAGE.password}    ${senha}
    Click Element    ${LOGIN_PAGE.button}

realizar cadastro de empresa
    Wait Until Element Is Visible    ${TELA_INICIAL.scf}
    Click Element    ${TELA_INICIAL.scf}
    Wait Until Element Is Visible    ${HOME.button_empresa}
    Click Element    ${HOME.button_empresa}
    Wait Until Element Is Visible    ${EMPRESA.button_cadastrar_empresa}
    Click Element    ${EMPRESA.button_cadastrar_empresa}
    Wait Until Element Is Visible    ${CADASTRAR_EMPRESA.nome}
    ${textoAleatorio}    Generate Random String    14
    Input Text    ${CADASTRAR_EMPRESA.nome}    ${textoAleatorio}
    Input Text    ${CADASTRAR_EMPRESA.cnpj}    ${textoAleatorio}
    Input Text    ${CADASTRAR_EMPRESA.numero}    ${textoAleatorio}
    Input Text    ${CADASTRAR_EMPRESA.setor}    ${textoAleatorio}
    Input Text    ${CADASTRAR_EMPRESA.endereco}    ${textoAleatorio}
    Wait Until Element Is Visible    ${CADASTRAR_EMPRESA.button_confirmar_cadastro}
    Click Element    ${CADASTRAR_EMPRESA.button_confirmar_cadastro}
    Wait Until Element Is Visible    ${CADASTRAR_EMPRESA.button_confirmar}
    Click Element    ${CADASTRAR_EMPRESA.button_confirmar}

Verificar se fez cadastro com sucesso
    Wait Until Element Is Visible    ${CADASTRAR_EMPRESA.confirmacao}
    ${compara}    Get Text    ${CADASTRAR_EMPRESA.confirmacao}
    Should Contain    ${compara}    Empresa cadastrada com sucesso!

*** Test Cases ***

teste cadastrar empresa como gestor
    realizar login com ${GESTOR_VALIDO} e ${SENHA_VALIDO}
    realizar cadastro de empresa
    Verificar se fez cadastro com sucesso

teste login valido colaborador
    realizar login com ${COLABORADOR_VALIDO} e ${SENHA_VALIDO}
    realizar cadastro de empresa
    Verificar se fez cadastro com sucesso