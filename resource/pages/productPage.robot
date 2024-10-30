*** Settings ***
Library     Browser
    
*** Variables ***
${page_title_selector}	        span[data-test="title"]

*** Keywords ***
Estou na Pagina de Produtos
	Wait For Elements State 	${page_title_selector}	    visible
