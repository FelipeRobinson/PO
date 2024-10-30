*** Settings ***
Library		Browser
Resource    ../resource/global.robot
Resource    ../resource/pages/loginPage.robot
Resource    ../resource/pages/productPage.robot

Test Setup        Acessar Pagina Saucedemo
Test Teardown	    Fechar o Navegador

*** Test Cases ***
Login bem-sucedido
	Preecher Login e Senha    ${USUARIO}    ${SENHA}
	Logar
	Estou na Pagina de Produtos

Login com Dados em Branco
	Logar
	Mensagem de Erro Emitida

Login com Usuario Inexistente
	Preecher Login e Senha    "invalido"    ${SENHA}
	Logar
	Mensagem de Erro Emitida

Login com Senha Invalida
	Preecher Login e Senha    ${USUARIO}    "invalida"
	Logar
	Mensagem de Erro Emitida
