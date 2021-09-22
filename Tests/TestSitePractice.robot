*** Settings ***
Resource        ../Resources/Resource.robot
##Suite Setup     Abrir navegador
Test Setup      Abrir navegador
##Suite Teardown      Fechar navegador
Test Teardown       Fechar navegador

### SETUP Inicia a keyword anstes da suite de um teste
### TEARDOWN Inicia a Keyword depois de uma suite ou de um teste
*** Variables ***

*** Test Case ***

Caso de Teste 01: Pesquisar produto existente
    Acessar a página home do site
    Verificar o nome do produto "Blouse" no campo de pesquisa
    Validar botão pesquisa
    Validar se o "Blouse" foi encontrado
    Validar se o título da aba do site está correto
    Validar a legenda da imagem do "Blouse"
    Validar o "$ 27.00" do "Blouse"

Caso de Teste 02: Pesquisar produto não existente
    Acessar a página home do site
    Verificar o nome do produto "produtoNãoExistente" no campo de pesquisa
    Validar botão pesquisa
    Validar se a mensagem de erro "No results were found for your search "produtoNãoExistente""

#*** Keywords ***
#
#
#
#
#
