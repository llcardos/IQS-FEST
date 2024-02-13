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

&{SERVICO}
...    button_cadastrar_servico=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Cadastrar Serviço')]

&{CADASTRAR_SERVICO}
...    nome=//input[@placeholder="Nome do Serviço"]
...    descricao=xpath://textarea[@placeholder="Descrição do Serviço"]
...    button_confirmar_cadastro=xpath://button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Confirmar Cadastro')]
...    button_confirmar=xpath://button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (text()='Confirmar')]
...    confirmacao=xpath://div[@class='Toastify__toast-body']/div[.='Serviço cadastrado com sucesso!']

*** Keywords ***
realizar login com ${usuario} e ${senha}
    Input Text    ${LOGIN_PAGE.email}    ${usuario}
    Input Text    ${LOGIN_PAGE.password}    ${senha}
    Click Element    ${LOGIN_PAGE.button}

realizar cadastro de servico
    Wait Until Element Is Visible    ${TELA_INICIAL.scf}
    Click Element    ${TELA_INICIAL.scf}
    Wait Until Element Is Visible    ${HOME.button_servico}
    Click Element    ${HOME.button_servico}
    Wait Until Element Is Visible    ${SERVICO.button_cadastrar_servico}
    Click Element    ${SERVICO.button_cadastrar_servico}
    Wait Until Element Is Visible    ${CADASTRAR_SERVICO.nome}
    ${textoAleatorio}    Generate Random String    10
    Input Text    ${CADASTRAR_SERVICO.nome}    ${textoAleatorio}
    Input Text    ${CADASTRAR_SERVICO.descricao}    ${textoAleatorio}
    Wait Until Element Is Visible    ${CADASTRAR_SERVICO.button_confirmar_cadastro}
    Click Element    ${CADASTRAR_SERVICO.button_confirmar_cadastro}
    Wait Until Element Is Visible    ${CADASTRAR_SERVICO.button_confirmar}
    Click Element    ${CADASTRAR_SERVICO.button_confirmar}

Verificar se fez cadastro com sucesso
    Wait Until Element Is Visible    ${CADASTRAR_SERVICO.confirmacao}
    ${compara}    Get Text    ${CADASTRAR_SERVICO.confirmacao}
    Should Contain    ${compara}     Serviço cadastrado com sucesso!

*** Test Cases ***

teste cadastrar servico como gestor
    realizar login com ${GESTOR_VALIDO} e ${SENHA_VALIDO}
    realizar cadastro de servico
    Verificar se fez cadastro com sucesso

teste login valido colaborador
    realizar login com ${COLABORADOR_VALIDO} e ${SENHA_VALIDO}
    realizar cadastro de servico
    Verificar se fez cadastro com sucesso