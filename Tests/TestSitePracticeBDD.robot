*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}          http://http://automationpractice.com
${BROWSER}      chrome

*** Test Case ***
Caso de Teste 01: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "produtoNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search"produtoNãoExxistente""

*** Keywords ***





