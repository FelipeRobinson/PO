*** Settings ***
Library     Browser 


*** Variables ***
############ Selectors
${username_selector}        input[data-test="username"]
${password_selector}        input[data-test="password"]
${login_button_selector}    input[data-test="login-button"]
${error_button_selector}    button[data-test="error-button"]


*** Keywords ***
Estou na Pagina de Login
    Wait For Elements State 	${login_button_selector}    visible

Preecher Login e Senha
    [Arguments]          ${user}                    ${pass}    
    Fill Text	         ${username_selector}	    ${user}
	Fill Text	         ${password_selector} 	    ${pass}
	
Logar
	Click	${login_button_selector}

Mensagem de Erro Emitida
    Wait For Elements State 	${error_button_selector}    visible