Documentação: arquivo de configuraçâo do Robot
Autor: Maria Luiza Paula
*** Settings ***
Library                                                    SeleniumLibrary
Library                                                    AutoRecorder
Library                                                    FakerLibrary        locale=pt_BR
Library                                                    DateTime
Library                                                    String
Library                                                    OperatingSystem
Resource                                                   ../Steps/steps.robot
Resource                                                   ../Page/page.robot

*** variable ***
${site}                                                    https://atendimento.electrolux.com.br/
${email}                                                   https://www.mailinator.com/v4/public/inboxes.jsp
${browser}                                                 chrome

*** Keywords ***
Abrir navegador
    [Arguments]                                            ${tela}
    Open Browser                                           ${tela}        ${browser}
    Maximize Browser Window
    Print Tela

Fechar navegador
    Print Tela
    Close Browser
    
Aguarda
    Sleep                                                  2

Print Tela
    SeleniumLibrary.Capture Page Screenshot

Ir Ate
    [Arguments]                                            ${element}
    Valida Elemento                                        ${element}
    Scroll Element Into View                               ${element}

Esta Visivel
    [Arguments]                                            ${element}
    Wait Until Element Is Visible                          ${element}        3

Valida Elemento
    [Arguments]                                            ${element}
    ${status}      Run Keyword And Return Status           Esta Visivel      ${element}
    Aguarda
    Run Keyword if     '${status}' == 'False'    Fatal Error  msg=O Elemento '${element}' não encontrado na tela

Preenche Text
    [Arguments]                                            ${input}          ${item}
    Valida Elemento                                        ${input}          
    SeleniumLibrary.Input Text                             ${input}          ${item}

Click no Texto
    [Arguments]                                            ${texto}
    ${element}        Set Variable                         //*[contains(text(),'${texto}')]
    Click no Item                                          ${element}

Click no Item
    [Arguments]                                            ${item}
    Aguarda
    Valida Elemento                                        ${item}
    SeleniumLibrary.Click Element                          ${item}

Gerar Cliente
    ${Nome}                                                FakerLibrary.Name
    ${Palavra}                                             FakerLibrary.Word
    # ${Final}          Set Variable                         @mailinator.com                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             et Variable                         @Malinator.com
    ${Email}          Set Variable                         ${Palavra}ma@mailinator.com
    ${Senha}                                               FakerLibrary.Password
    &{CLIENTE}        Create Dictionary                    nome=${Nome}    email=${Email}    senha=${senha}
    ${String}         Set Variable                         nome=${Nome} email=${Email} senha=${senha}
    ${CurrentDate}    Get Current Date                     result_format=%d-%m-%Y-%H-%M-%S
    ${ClientArq}      Set Variable                         Usuario-${CurrentDate}.txt
    Criar Arquivo     ${ClientArq}                         ${String}
    [Return]          &{CLIENTE}
    
Criar Arquivo
    [Arguments]       ${nomeArquivo}                    ${ConteudoArquivo}
    Create File       ./Resources/${nomeArquivo}                 ${ConteudoArquivo}  

Verifica Se Contem
    [Arguments]            ${element}        ${text}
    Element Should Contain     ${element}        ${text}                                               
