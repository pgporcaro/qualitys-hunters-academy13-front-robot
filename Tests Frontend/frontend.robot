***Settings***
Library  SeleniumLibrary

*** Variables ***
${URL_HOME_QACODERS}                    https://automacao.qacoders-academy.com.br/login
${EMAIL}                                id=email
${EMAIL_VALIDO}                         sysadmin@qacoders.com
${EMAIL_INVALIDO}                       sysadmin@qacoders.com123
${SENHA_VALIDA}                         1234@Test
${SENHA_INVALIDA}                       Test123423@
${BOTAO_CADASTRO}                       xpath=//span[contains(.,'Cadastros')]
#diretoria
${BOTAO_DIRETORIAS}                     xpath=//span[contains(.,'Diretorias')]
${BOTAO_NOVO_DIRETORIAS}                xpath=//button[contains(.,'Novo Cadastro')]
${INPUT_NOME_DA_DIRETORIA}              xpath=(//label[contains(.,'Nome da Diretoria*')]/following::input)[1]
${NOME_DIRETORIA}                       affllllladasfghs
${BOTAO_SALVAR_NOVA_DIRETORIA}          xpath=//button[contains(.,'SALVAR NOVO')]
#centro de custo
${BOTAO_CENTRO_DE_CUSTO}                xpath=//span[contains(.,'Centro de Custo')]
${BOTAO_NOVO_CENTRO_DE_CUSTO}           id=Novo Cadastro
${INPUT_CENTRO_DE_CUSTO}                xpath=(//label[contains(.,'Nome do Centro de Custo*')]/following::input)[1]
${NOME_CENTRO_DE_CUSTO}                 BONITA27HUNTERS
${SELECT_NOME_DIRETORIA}                id=Diretoria
${BOTAO_SALVAR_NOVO_CENTRO_DE_CUSTO}    xpath=//button[contains(.,'SALVAR NOVO')]
${SETA_ABRIR_CENTRO_CUSTOS}             xpath=(//select[@id='Centro de Custo'])[1]
#departamento
${NOME_DEPARTAMENTO}                    LEZCANO27HUNTERS
${BOTAO_DEPARTAMENTO}                   xpath=//span[normalize-space(text())='Departamento']
${BOTAO_NOVO_DEPARTAMENTO}              id=Novo Cadastro
${INPUT_NOME_DEPARTAMENTO}              id=departmentName
${SELECT_CENTRO_DE_CUSTO}               xpath=(//select[@id='Centro de Custo'])[1]
${BOTAO_SALVAR_NOVO_DEPARTAMENTO}       xpath=//button[@type='submit']

*** Test Cases ***

Login com sucesso
    Abrir o site do QA.Coders
    Preeencher campo e-mail com um e-mail válido 
    Preencher campo senha com uma senha válida
    Clicar com o botão entrar
    Clicar no botão cadastro

Criar uma diretoria
    Abrir o site do QA.Coders
    Preeencher campo e-mail com um e-mail válido 
    Preencher campo senha com uma senha válida
    Clicar com o botão entrar
    Clicar no botão cadastro
    Clicar no botão diretorias
    Clicar no botão nova diretorias
    Preencher o campo Nome da Diretoria
    Clicar no botão Salvar Cadastro da nova diretoria
    
Criar um centro de custo    
    Abrir o site do QA.Coders
    Preeencher campo e-mail com um e-mail válido 
    Preencher campo senha com uma senha válida
    Clicar com o botão entrar
    Clicar no botão cadastro
    Clicar no botão Centro de Custo
    Clicar no botão Novo cadastro de Centro de Custos
    Preencher a tela de novo centro de custo
    Clicar no botão Salvar Novo Centro de Custo
    
 Criar um departamento
    Abrir o site do QA.Coders
    Preeencher campo e-mail com um e-mail válido 
    Preencher campo senha com uma senha válida
    Clicar com o botão entrar
    Clicar no botão cadastro
    Clicar no botão departamento
    Clicar no botão Novo departamento
    Preencher a tela de novo cadastro de departamento
    Clicar no botão Salvar Novo Departamento

Login com e-mail inválido
    Abrir o site do QA.Coders
    Preeencher campo e-mail com um e-mail inválido
    Preencher campo senha com uma senha válida
    Clicar com o botão entrar

Listar departamentos
    Abrir o site do QA.Coders
    Preeencher campo e-mail com um e-mail válido 
    Preencher campo senha com uma senha válida
    Clicar com o botão entrar
    Clicar no botão cadastro
    Clicar no botão departamento
    Listar todos os departamentos

*** Keywords ***

Abrir o site do QA.Coders
    Open Browser  ${URL_HOME_QACODERS}    chrome
    Maximize Browser Window
    Sleep    5

Preeencher campo e-mail com um e-mail válido 
    Wait Until Element Is Visible    ${EMAIL}    20s
    Input Text    ${EMAIL}   ${EMAIL_VALIDO}

Preeencher campo e-mail com um e-mail inválido
    Wait Until Element Is Visible    ${EMAIL}    20s
    Input Text    ${EMAIL}    ${EMAIL_INVALIDO}    

Preencher campo senha com uma senha válida
    Input Text    id=password    ${SENHA_VALIDA}

Preencher campo senha com uma senha inválida
    Input Text    id=password    ${SENHA_INVALIDA}

Clicar com o botão entrar
    Click Element    xpath=//button[normalize-space(text())='Entrar']
    Sleep    10s

Clicar no botão cadastro 
    Wait Until Element Is Visible    ${BOTAO_CADASTRO}    20s
    Click Element                    ${BOTAO_CADASTRO}

Clicar no botão diretorias
    Wait Until Element Is Visible    ${BOTAO_DIRETORIAS}    20s
    Click Element                    ${BOTAO_DIRETORIAS}

Clicar no botão nova diretorias
    Wait Until Element Is Visible    ${BOTAO_NOVO_DIRETORIAS}    20s
    Click Element                    ${BOTAO_NOVO_DIRETORIAS}

Preencher o campo Nome da Diretoria
    Input Text                       ${INPUT_NOME_DA_DIRETORIA}    ${NOME_DIRETORIA}

Clicar no botão Salvar Cadastro da nova diretoria
    Wait Until Element Is Visible        ${BOTAO_SALVAR_NOVA_DIRETORIA}    20s 
    Click Element                        ${BOTAO_SALVAR_NOVA_DIRETORIA}
    Sleep    5s

Clicar no botão Centro de Custo
    Wait Until Element Is Visible    ${BOTAO_CENTRO_DE_CUSTO}    20s
    Click Element                    ${BOTAO_CENTRO_DE_CUSTO}

Clicar no botão Novo cadastro de Centro de Custos
    Wait Until Element Is Visible    ${BOTAO_NOVO_CENTRO_DE_CUSTO}    20s
    Click Element                    ${BOTAO_NOVO_CENTRO_DE_CUSTO}
    Sleep    5s

Preencher a tela de novo centro de custo
    Wait Until Element Is Visible    ${INPUT_CENTRO_DE_CUSTO}
    Input Text                       ${INPUT_CENTRO_DE_CUSTO}    ${NOME_CENTRO_DE_CUSTO}
    Wait Until Element Is Visible    ${SELECT_NOME_DIRETORIA}
    Select From List By Label        ${SELECT_NOME_DIRETORIA}    ${NOME_DIRETORIA}
    Sleep    2s
    Click Element                    id=save
    Sleep    15s

Clicar no botão Salvar Novo Centro de Custo
    Wait Until Element Is Visible        ${BOTAO_SALVAR_NOVO_CENTRO_DE_CUSTO}    20s 
    Click Element                        ${BOTAO_SALVAR_NOVO_CENTRO_DE_CUSTO}
   
Clicar no botão departamento
    Wait Until Element Is Visible        ${BOTAO_DEPARTAMENTO}    20s
    Click Element                        ${BOTAO_DEPARTAMENTO}
    Sleep    2s

Clicar no botão Novo departamento
    Wait Until Element Is Visible    ${BOTAO_NOVO_DEPARTAMENTO}    20s
    Click Element                    ${BOTAO_NOVO_DEPARTAMENTO}
    Sleep    2s

Preencher a tela de novo cadastro de departamento
    Wait Until Element Is Visible    ${INPUT_NOME_DEPARTAMENTO}
    Input Text                       ${INPUT_NOME_DEPARTAMENTO}    LEZCANO26HUNTERS
    Click Element                    ${SELECT_CENTRO_DE_CUSTO} 
    Select From List By Index        xpath=(//select[@id='Centro de Custo'])[1]    1 
    Click Element                    xpath=(//select[@id='Centro de Custo'])[1]
    Click Element                    xpath=//button[@type='submit']
    Sleep    15s

Pesquisar o centro de custo cadastrado
    Wait Until Element Is Visible    ${SELECT_CENTRO_DE_CUSTO}    20s
    Select From List By Label        ${SELECT_CENTRO_DE_CUSTO}           ${NOME_CENTRO_DE_CUSTO}
    Input Text                       ${INPUT_CENTRO_DE_CUSTO}            ${NOME_CENTRO_DE_CUSTO}    

Clicar no botão Salvar Novo Departamento
    Wait Until Element Is Visible        ${BOTAO_SALVAR_NOVO_DEPARTAMENTO} 
    Click Element                        ${BOTAO_SALVAR_NOVO_DEPARTAMENTO}
    Sleep    5s

Listar todos os departamentos
    Wait Until Element Is Visible    ${BOTAO_DEPARTAMENTO}    20s
    Click Element                    ${BOTAO_DEPARTAMENTO}
    Sleep    2s
    # Capturar a lista de departamentos
    ${departamentos}    Get WebElements    xpath=//div[@class='department-list']//div[@class='department-item']
    # Iterar sobre a lista de departamentos e imprimir os nomes
    FOR    ${departamento}    IN    @{departamentos}
        ${nome_departamento}    Get Text    ${departamento}
        Log    ${nome_departamento}
    END
    # Adicionar mais verificações conforme necessário
