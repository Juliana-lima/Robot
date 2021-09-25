*** Settings ***
Library     SeleniumLibrary
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variables ***
${BROWSER}          chrome
${URL}              http://automationpractice.com


*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultados da busca

Caso de Teste 02: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""

*** Keywords ***

Abrir navegador
    Open Browser        http://automationpractice.com   googlechrome
    Maximize Browser Window

Fechar navegador
    Close Browser

Dado que estou na página home do site
    Title Should Be     My Store

Quando eu pesquisar pelo produto "${PRODUTO}"
    Input Text          search_query_top     ${PRODUTO}
    Click Element       submit_search

Então o produto "${PRODUTO}" deve ser listado na página de resultados da busca
    Page Should Contain Link            //*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible       //*[@id="center_column"]/p[@class="alert alert-warning"]
    Element Text Should Be              //*[@id="center_column"]/p[@class="alert alert-warning"]        ${MENSAGEM_ALERTA}


