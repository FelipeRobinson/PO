*** Settings ***
Library		Browser
Resouuce    ../resource/global.robot
Resource    ../resource/pages/loginPage.robot


*** Variables ***
############ Selectors
${username_selector}            input[data-test="username"]
${password_selector}            input[data-test="password"]

# Menu selector
${menu_selector}                button[id="react-burger-menu-btn"]
${logout_selector}              a[id="logout_sidebar_link"]

# products Selectors
${backpack_selector}            button[data-test="add-to-cart-sauce-labs-backpack"]    
${bike_light_selector}          button[data-test="add-to-cart-sauce-labs-bike-light"]  
${backpack_selector_remove}     button[data-test="remove-sauce-labs-backpack"]

# cart selector
${cart_badge}                   xpath=//span[@class='shopping_cart_badge']
#                               span[data-test="shopping-cart-badge"]
${cart_access}                  a[data-test="shopping-cart-link"]

${checkout_selector}            button[id=checkout]
${tax_selector}                 div[data-test="tax-label"]
${total_selector}               div[data-test="total-label"]
${subtotal_selector}            div[data-test="subtotal-label"]
${products_prices_selector}     div[data-test="inventory-item-price"]

${ckout_firt_name}              input[data-test="firstName"]
${ckout_last_name}              input[data-test="lastName"]
${ckout_postal_code}            input[data-test="postalCode"]
${continue_selector}            input[data-test="continue"]

*** Keywords ***


Acessar Pagina Principal
	Acessar pagina Saucedemo
	Preecher Login e Senha
	Logar

Adicionar Produto
    	[Arguments]  ${product_selector}
    Click        ${product_selector}

Remover Produto
    	[Arguments]  ${product_selector}
	Click	    ${cart_access} 
    Click	    ${product_selector}
    
Realizar Logout
    Click    ${menu_selector}
    Click    ${logout_selector}  

Quantidade de Produtos deve ser 
    	[Arguments]  ${cart_itens}
    ${cart_quantity}=    Get Text    ${cart_badge} 
	Should Be Equal     ${cart_quantity}     ${cart_itens}

Acessar Carrinho de Compra
    Click    ${cart_access}

Acessar Checkout 
    Click        ${checkout_selector}
	Fill Text    ${ckout_firt_name}    "Souce"
	Fill Text    ${ckout_last_name}    "Demo"
	Fill Text    ${ckout_postal_code}     "13020060"
	Click        ${continue_selector}

Total do Carrinho deve ser a Soma dos Produtos 
    # Obtém o valor total
    ${subtotal}=        Get Text    ${subtotal_selector}
    ${total}=        Get Text    ${total_selector}
	${tax}=        Get Text    ${tax_selector}
    # Remove o prefixo e converte para um número
	${subtotal_value}=    Convert To Number    ${subtotal}[13:]  # Remove o Total: $
	${total_value}=    Convert To Number    ${total}[8:]  # Remove o Total: $
	${tax_value}=    Convert To Number    ${tax}[6:]  # Remove Tax: $

    ${total_calculated}	    Evaluate	${subtotal_value} + ${tax_value}
    Should Be Equal As Numbers    ${total_value}    ${total_calculated}

*** Test Cases ***
Adicionar Produtos ao Carrinho
    Acessar Pagina Principal
    Adicionar Produto     ${backpack_selector}    
    Quantidade de Produtos deve ser     1
    Adicionar Produto     ${bike_light_selector}
    Quantidade de Produtos deve ser     2
	Realizar Logout

Remover produto do carrinho
    Acessar Pagina Principal
    Adicionar Produto     ${backpack_selector}    
    Adicionar Produto     ${bike_light_selector}
    Quantidade de Produtos deve ser     2
    Remover Produto         ${backpack_selector_remove} 
    Quantidade de Produtos deve ser     1
	Realizar Logout

Checkout - Total da Compra
    Acessar Pagina Principal
    Adicionar Produto     ${backpack_selector}    
    Adicionar Produto     ${bike_light_selector}
    Quantidade de Produtos deve ser     2
    Acessar Carrinho de Compra
	Acessar Checkout
	Total do Carrinho deve ser a Soma dos Produtos 

	Realizar Logout