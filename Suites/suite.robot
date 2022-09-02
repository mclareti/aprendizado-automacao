Documentação: Suite para execução dos testes
Autor: Maria Luiza Paula


*** Settings ***
Resource                ../Steps/steps.robot
Resource                ../Resources/config.robot 
Resource                ../Page/page.robot  

Test Setup          Abrir navegador        ${site}
Test Teardown       Fechar navegador


*** Test Cases ***
# robot -t "CT01-Criar usuario no site" -d ./Reports/CT01 "Suites\suite.robot"
CT01-Criar usuario no site
    Dado que eu crio um email e acesso o site Electrolux
    Quando crio uma conta no site
    Então verifico mensagem "Confirmação de cadastro" que ela foi criada com sucesso
