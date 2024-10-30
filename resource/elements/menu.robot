*** Settings ***
Library     Browser 

*** Variables ***
############ Selectors
${open_menu_selector}           button[id="react-burger-menu-btn"]
${close_menu_selector}          button[id="react-burger-cross-btn"]
${all_items_selector}           a[data-test="inventory-sidebar-link"]
${about_selector}               a[data-test="about-sidebar-link"]
${logout_selector}              a[data-test="logout-sidebar-link"]
${reset_app_state_sectorel}     a[data-test="reset-sidebar-link"]

*** Keywords ***
Deslogar
    Click    ${open_menu_selectoren}
    Click    ${logout_selector}

Resetar Carrinho
    Click    ${open_menu_selectoren}
    Click    ${reset_app_state_sectorel}
    Click    ${close_menu_selector} 

Abrir Vitrine de Produtos
    Click    ${open_menu_selectoren}
    Click    ${all_items_selector}
    Click    ${close_menu_selector} 

Abrir Sobre
    Click    ${open_menu_selectoren}
    Click    ${about_selector}
