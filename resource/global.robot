*** Settings ***
Library		Browser

*** Variables ***
# Contents
${URL}	                    https://www.saucedemo.com/
${SENHA}	                secret_sauce 
${USUARIO}	                    standard_user

*** Keywords ***
Acessar Pagina Saucedemo
	Open Browser                https://www.saucedemo.com/ 	headless=false
	Wait For Elements State     css=div.login_logo          visible

Fechar o Navegador
	Close Browser