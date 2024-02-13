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
...    erro_mesage=xpath://div[@role='alert']/div[2]

&{TELA_INICIAL}
...     greet=xpath://div[@class="sc-eqUAAy PLHUq"]//span
...     sair=xpath://span[text()='Sair']
...     modal_confirmar=//button[@class="botao-default btn btn-var(--verde-primario)"]
...     scf=//div[@title="Sistema de Competência"]

&{HOME}
...    button_servico=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Serviço')]

&{SERVICO}
...    button_buscar_servico=//button[contains(@class,'botao-default btn btn-var(--verde-primario)') and (span='Buscar Serviço')]

&{BUSCAR_SERVICO}
...    filtro_servico=//input[@class='form-control']
...    voltar=//button[@class='botao-default btn btn-var(--cinza-primario)']

*** Keywords ***
realizar login com ${usuario} e ${senha}
    Input Text    ${LOGIN_PAGE.email}    ${usuario}
    Input Text    ${LOGIN_PAGE.password}    ${senha}
    Click Element    ${LOGIN_PAGE.button}


realizar busca de servico
    Wait Until Element Is Visible    ${TELA_INICIAL.scf}
    Click Element    ${TELA_INICIAL.scf}
    Wait Until Element Is Visible    ${HOME.button_servico}
    Click Element    ${HOME.button_servico}
    Wait Until Element Is Visible    ${SERVICO.button_buscar_servico}
    Click Element    ${SERVICO.button_buscar_servico}
    Wait Until Element Is Visible    ${BUSCAR_servico.filtro_servico}
    Click Element    ${BUSCAR_SERVICO.filtro_servico}
    Input Text    ${BUSCAR_SERVICO.filtro_servico}    Pudim
    Wait Until Element Is Visible    ${BUSCAR_SERVICO.voltar}
    Click Element    ${BUSCAR_SERVICO.voltar}

*** Test Cases ***

teste cadastrar competência como gestor
    realizar login com ${GESTOR_VALIDO} e ${SENHA_VALIDO}
    realizar busca de servico