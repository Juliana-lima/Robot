*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com

*** Keywords ***
###Setup e Teardown
Abrir navegador
    Open Browser    http://automationpractice.com   googlechrome
    Maximize Browser Window

Fechar navegador
    Close Browser

#### Passo-a-Passo
Acessar a página home do site

        Title Should Be     My Store

Verificar o nome do produto "${PRODUTO}" no campo de pesquisa

        Input Text      search_query_top     ${PRODUTO}

Validar botão pesquisa

        Click Element        submit_search

Validar se o "${PRODUTO}" foi encontrado

        Wait Until Element Is Visible       css=#center_column > h1 > span.lighter

Validar se o título da aba do site está correto

        Title Should Be                     Search - My Store

Validar a legenda da imagem do "${PRODUTO}"

        Page Should Contain Link            xpath://*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Validar o "${VALOR}" do "${PRODUTO}"

        Page Should Contain Element         xpath://*[@id="center_column"]//span[@class="price product-price"]["${VALOR}"]

Validar se a mensagem de erro "${MENSAGEM_ALERTA}"

        Wait Until Element Is Visible       xpath://*[@id="center_column"]/p[@class="alert alert-warning"]
        Element Text Should Be              xpath://*[@id="center_column"]/p[@class="alert alert-warning"]      ${MENSAGEM_ALERTA}






