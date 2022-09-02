Documentação: elementos capturados das telas para interação com aplicação
Autor: Maria Luiza Paula


*** Settings ***
Resource                ../Resources/config.robot
Resource                ../Steps/steps.robot
 



*** variables ***
${BtnLogin}                    xpath=//div[@class='my-account']
${InputMailinator}             xpath=//input[@id='inbox_field']
${BtnMailinator}               xpath=//button[@class='primary-btn']
${BtnCriarConta}               xpath=//button[contains(.,'Criar conta')]
${InputEmail}                  xpath=//input[@type='email']
${inputNome}                   xpath=//input[@formcontrolname='name']
${CriarSenha}                  xpath=//input[@formcontrolname='password']
${ConfirmSenha}                xpath=//input[@formcontrolname='confirmPassword']
${Label}                       xpath=//section[@id='assistance']
${ChkBoxTermo}                 xpath=//input[@type='checkbox']/..
${ConfirmaCadastro}            xpath=//h2[@class='title-1']
${InputSenha}                  xpath=//input[@type='password']
${BtnAceitar}                  xpath=//button[contains(.,'Aceitar')]