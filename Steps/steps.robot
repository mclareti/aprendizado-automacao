Documentação: Steps a ser implementado nos testes
Autor: Maria Luiza Paula


*** Settings ***
Resource                ../Resources/config.robot
Resource                ../Page/page.robot





*** Keywords ***
Dado que eu crio um email e acesso o site Electrolux
    Go To                  ${email}
    &{USUARIO}             Gerar Cliente
    Set Test Variable      &{USUARIO}
    Aguarda
    Preenche Text          ${InputMailinator}            ${USUARIO.email}
    Print Tela
    Click no Item          ${BtnMailinator} 
    Go To                  ${site}
    Print Tela
    Aguarda
    Click no Item          ${BtnLogin} 
    



Quando crio uma conta no site
    Aguarda
    Print Tela
    Click no Item          ${BtnAceitar}
    Ir Ate                 ${InputSenha}
    Click no Item          ${BtnCriarConta}
    Aguarda
    Print Tela
    Preenche Text          ${InputNome}                ${USUARIO.nome}
    Preenche Text          ${InputEmail}               ${USUARIO.email}
    Preenche Text          ${CriarSenha}               ${USUARIO.senha}
    Preenche Text          ${ConfirmSenha}             ${USUARIO.senha}
    Ir Ate                 ${Label}
    Print Tela
    Click no Item          ${BtnCriarConta}
    
    




Então verifico mensagem "${mensagem}" que ela foi criada com sucesso
    Aguarda
    Print Tela
    Valida Elemento        ${ConfirmaCadastro} 
    Verifica Se Contem     ${ConfirmaCadastro}        ${mensagem} 
