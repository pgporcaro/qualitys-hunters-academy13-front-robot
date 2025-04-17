***Settings***
Library  SeleniumLibrary
Library  String
Library  Collections

*** Variables ***
${URL_HOME_QACODERS}                    https://qualitys-hunters-front.qacoders.dev.br/login
${BROWSER}                              chrome
${BROWSER_OPTIONS}                      --user-data-dir=/tmp/unique-session
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
${NOME_DIRETORIA}                       P&G
${BOTAO_SALVAR_NOVA_DIRETORIA}          xpath=//button[contains(.,'SALVAR NOVO')]
${NOME_DIRETORIA_GERADA}                PAULOPORCARO
#centro de custo
${BOTAO_CENTRO_DE_CUSTO}                xpath=//div[@id='Centro de Custo']
${BOTAO_NOVO_CENTRO_DE_CUSTO}           id=Novo Cadastro
${INPUT_CENTRO_DE_CUSTO}                xpath=(//label[contains(.,'Nome do Centro de Custo*')]/following::input)[1]
${NOME_CENTRO_DE_CUSTO}                 $P
${SELECT_NOME_DIRETORIA}                id=Diretoria
${BOTAO_SALVAR_NOVO_CENTRO_DE_CUSTO}    xpath=//button[@id='save']
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
Login com e-mail inválido
    Abrir o site do QA.Coders
    Preeencher campo e-mail com um e-mail inválido
    Preencher campo senha com uma senha válida
    Clicar com o botão entrar

Criar uma diretoria
    Abrir o site do QA.Coders
    Preeencher campo e-mail com um e-mail válido 
    Preencher campo senha com uma senha válida
    Clicar com o botão entrar
    Clicar no botão cadastro
    Clicar no botão diretorias
    Clicar no botão nova diretorias
    Criar Massa de dados
    Preencher o campo Nome da Diretoria
    Capturar Nome da Diretoria Gerada
    Clicar no botão Salvar Cadastro da nova diretoria
    
#Criar um centro de custo    
    # Abrir o site do QA.Coders
    # Preeencher campo e-mail com um e-mail válido 
    # Preencher campo senha com uma senha válida
    # Clicar com o botão entrar
    # Clicar no botão cadastro
    # Clicar no botão Centro de Custo
    # Clicar no botão Novo cadastro de Centro de Custos
    # Preencher a tela de novo centro de custo com diretoria gerada
    # Clicar no botão Salvar Novo Centro de Custo
    
#Criar um departamento
    # Abrir o site do QA.Coders
    # Preeencher campo e-mail com um e-mail válido 
    # Preencher campo senha com uma senha válida
    # Clicar com o botão entrar
    # Clicar no botão cadastro
    # Clicar no botão departamento
    # Clicar no botão Novo departamento
    # Preencher a tela de novo cadastro de departamento
    # Clicar no botão Salvar Novo Departamento


#Listar departamentos
    # Abrir o site do QA.Coders
    # Preeencher campo e-mail com um e-mail válido 
    # Preencher campo senha com uma senha válida
    # Clicar com o botão entrar
    # Clicar no botão cadastro
    # Clicar no botão departamento
    # Listar todos os departamentos

*** Keywords ***

Abrir o site do QA.Coders
    Open Browser  ${URL_HOME_QACODERS}    ${BROWSER}    options=add_argument("--headless")
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


Criar Massa de dados
    # Gerar uma string aleatória de 2 caracteres
    ${palavra_aleatoria}    Generate Random String    length=2    chars=[LETTERS]
    # Converter para letras maiúsculas
    ${palavra_aleatoria}    Convert To Upper Case    ${palavra_aleatoria}
    # Log para verificar a palavra gerada
    Log    Palavra Aleatória Gerada: ${palavra_aleatoria}
    # Definir como variável global para uso posterior
    Set Global Variable    ${palavra_aleatoria}

Clicar no botão diretorias
    Wait Until Page Contains Element    ${BOTAO_DIRETORIAS}    30s
    Wait Until Element Is Visible       ${BOTAO_DIRETORIAS}    30s
    Click Element                       ${BOTAO_DIRETORIAS}
    Sleep    2s

Clicar no botão nova diretorias
    Wait Until Element Is Visible    ${BOTAO_NOVO_DIRETORIAS}    20s
    Click Element                    ${BOTAO_NOVO_DIRETORIAS}

Preencher o campo Nome da Diretoria
    # Concatenar o nome base da diretoria com a palavra aleatória
    ${NOME_DIRETORIA_GERADA}    Set Variable    ${NOME_DIRETORIA}${palavra_aleatoria}
    # Log para verificar o nome completo gerado
    Log    Nome da Diretoria Gerada: ${NOME_DIRETORIA_GERADA}
    # Preencher o campo com o nome gerado
    Input Text                       ${INPUT_NOME_DA_DIRETORIA}    ${NOME_DIRETORIA_GERADA}

Capturar Nome da Diretoria Gerada
    # Apenas log para confirmar que o nome já foi capturado
    Log    Diretoria Gerada: ${NOME_DIRETORIA_GERADA}

Clicar no botão Salvar Cadastro da nova diretoria
    Wait Until Element Is Visible        ${BOTAO_SALVAR_NOVA_DIRETORIA}    20s 
    Click Element                        ${BOTAO_SALVAR_NOVA_DIRETORIA}
    Sleep    5s

Clicar no botão Centro de Custo
    # Verificar se o botão de Centro de Custo está presente na página
    Wait Until Page Contains Element    ${BOTAO_CENTRO_DE_CUSTO}    30s
    # Garantir que o botão está visível
    Wait Until Element Is Visible       ${BOTAO_CENTRO_DE_CUSTO}    20s
    # Clicar no botão
    Click Element                       ${BOTAO_CENTRO_DE_CUSTO}
    Sleep    5s

Clicar no botão Novo cadastro de Centro de Custos
    Wait Until Page Contains Element    ${BOTAO_NOVO_CENTRO_DE_CUSTO}    30s
    Wait Until Element Is Visible       ${BOTAO_NOVO_CENTRO_DE_CUSTO}    20s
    Click Element                       ${BOTAO_NOVO_CENTRO_DE_CUSTO}
    Sleep    5s

Preencher a tela de novo centro de custo
    Wait Until Page Contains Element    ${INPUT_CENTRO_DE_CUSTO}    10s
    Wait Until Element Is Visible       ${INPUT_CENTRO_DE_CUSTO}
    Input Text                          ${INPUT_CENTRO_DE_CUSTO}    ${NOME_CENTRO_DE_CUSTO}
    Wait Until Page Contains Element    ${SELECT_NOME_DIRETORIA}    10s
    Wait Until Element Is Visible       ${SELECT_NOME_DIRETORIA}
    Select From List By Label           ${SELECT_NOME_DIRETORIA}    ${NOME_DIRETORIA}
    Sleep    2s
    Click Element                       id=save
    Sleep    5s

Preencher a tela de novo centro de custo com diretoria gerada
    # Verificar se o campo de nome do centro de custo está presente e visível
    Wait Until Page Contains Element    ${INPUT_CENTRO_DE_CUSTO}    30s
    Wait Until Element Is Visible       ${INPUT_CENTRO_DE_CUSTO}
    Input Text                          ${INPUT_CENTRO_DE_CUSTO}    ${NOME_CENTRO_DE_CUSTO}
    
    # Log para verificar o valor da diretoria gerada
    Log                                 Diretoria Gerada: ${NOME_DIRETORIA_GERADA}
    
    # Verificar se o seletor de diretoria está presente e visível
    Wait Until Page Contains Element    ${SELECT_NOME_DIRETORIA}    30s
    Wait Until Element Is Visible       ${SELECT_NOME_DIRETORIA}
    
    # Selecionar a diretoria gerada
    Select From List By Label           ${SELECT_NOME_DIRETORIA}    ${NOME_DIRETORIA_GERADA}
    Sleep    2s
    
    # Salvar o novo centro de custo
    Click Element                       id=save
    Sleep    15s

Clicar no botão Salvar Novo Centro de Custo
    Wait Until Page Contains Element    ${BOTAO_SALVAR_NOVO_CENTRO_DE_CUSTO}    20s
    Wait Until Element Is Visible       ${BOTAO_SALVAR_NOVO_CENTRO_DE_CUSTO}    20s
    Click Element                       ${BOTAO_SALVAR_NOVO_CENTRO_DE_CUSTO}
    Sleep    5s

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
