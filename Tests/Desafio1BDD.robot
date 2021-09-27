*** Settings ***
Library     SeleniumLibrary
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variables ***
${BROWSER}          chrome
${URL}              http://automationpractice.com

*** Test Case ***
Caso de Teste 01: Pesquisar Produtos Existentes
   Dado que estou na página home do site
   E digito por "Blouse" no campo de pesquisa
   Quando valido a pesquisa
   Então é exibido o produto "Blouse"

Caso de Teste 02: Pesquisar Produtos não Existentes
    Dado que estou na página home do site
    E digito por "produtoNãoExistente" no campo de pesquisa
    Quando valido a pesquisa
    Então é exibido a mensagem "No results were found for your search "produtoNãoExistente""

Caso de Teste 03: Listar Produtos
   Dado que estou na página home do site
   E passo o mouse em "Women"
   E a opção "Summer Dresses" é exibida na janela
   E clico em "Summer Dresses"
   Quando sou redirecionada para uma nova aba da página
   Então é possível ler a mensagem "Summer Dresses"

Caso de Teste 04: Adicionar Produtos no Carrinho
   Dado que estou na página home do site
   E digito por "t-shirt" no campo de pesquisa
   E valido a pesquisa
   E clico em "Add to cart"
   E uma nova janela é aberta para validar o item no carrinho
   Quando clico em "Proceed to checkout" para adicionar o produto
   Então valido que o item "t-shirt" está adicionado no carrinho

Caso de Teste 05: Remover Produtos com Carrinho Vazio
   Dado que estou na página home do site
   E clico no ícone do carrinho de compras vazio
   Quando sou direcionada para a página do carrinho de compras vazio
   Então visualizo a mensagem "Your shopping cart is empty."

Caso de Teste 06: Adiconar Cliente
    Dado que estou na página home do site
    E clico na opção "Sign in"
    E insiro o "fulanoJ03@test.com" no campo Email address
    E clico em "Creat an account"
    E sou direcionada para a página de autentificação
    E preencho os campos obrigatórios
    E clico em "Register" para finalizar o registro
    Quando sou redirecionada para página "My Account"
    Então visualizo a mensagem "Welcome to your account. Here you can manage all of your personal information and orders."

*** Keywords ***
Abrir navegador
    Open Browser        http://automationpractice.com   googlechrome
    Maximize Browser Window

Fechar navegador
    Close Browser

Dado que estou na página home do site
    Title Should Be     My Store

E digito por "${PRODUTO}" no campo de pesquisa
    Input Text          search_query_top     ${PRODUTO}

Quando valido a pesquisa
    Click Element       submit_search

Então é exibido o produto "${PRODUTO}"
    Page Should Contain Link            //*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Então é exibido a mensagem "${MENSAGEM_ALERTA}"
    
    Element Text Should Be              //*[@id="center_column"]/p[@class="alert alert-warning"]        ${MENSAGEM_ALERTA}

E passo o mouse em "Women"
    Mouse Over      //*[@id="block_top_menu"]//a

E a opção "Summer Dresses" é exibida na janela
    Wait Until Element Is Visible       //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

E clico em "Summer Dresses"
    Click Element                       //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Quando sou redirecionada para uma nova aba da página
    Title Should Be                     Summer Dresses - My Store

Então é possível ler a mensagem "Summer Dresses"
    Wait Until Element Is Visible   //*[@id="center_column"]/h1/span[1]

E valido a pesquisa
    Click Element       submit_search

E clico em "Add to cart"
    Mouse Over      //*[@id="center_column"]//a[@class="product-name"][contains(text(),"Faded Short Sleeve T-shirts")]
    Click Element   //*[@id="center_column"]//a[1]/span[contains(text(),"Add to cart")]

E uma nova janela é aberta para validar o item no carrinho
    Wait Until Element Is Visible       //*[@id="layer_cart"]/div[1]/div[1]/h2
    Page Should Contain                 Faded Short Sleeve T-shirts

Quando clico em "Proceed to checkout" para adicionar o produto
    Click Element                       //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span

Então valido que o item "t-shirt" está adicionado no carrinho
    Page Should Contain Image       //*[@id="product_1_1_0_0"]//*[@src="http://automationpractice.com/img/p/1/1-small_default.jpg"]

E clico no ícone do carrinho de compras vazio
    Wait Until Element Is Visible       //*[@id="header"]/div[3]//span[5][contains(text(),"empty")]
    Click Element                       //*[@id="header"]/div[3]/div/div/div[3]/div/a/b

Quando sou direcionada para a página do carrinho de compras vazio
    Wait Until Element Is Visible     //*[@id="center_column"]/p[contains(text(),"Your shopping cart is empty.")]

Então visualizo a mensagem "${MENSAGEM_ALERTA}"
    Element Text Should Be      //*[@id="center_column"]/p[contains(text(),"${MENSAGEM_ALERTA}")]     ${MENSAGEM_ALERTA}

E clico na opção "Sign in"
    Wait Until Element Is Visible       //*[@id="header"]//a[@class="login"][contains(text(),"Sign in")]
    Click Element                       //*[@id="header"]//a[@class="login"][contains(text(),"Sign in")]

E insiro o "${EMAIL}" no campo Email address
                      
    Input Text      //*[@id="email_create"]   ${EMAIL}

E clico em "Creat an account"
                     
    Click Element       //*[@id="SubmitCreate"]/span

E sou direcionada para a página de autentificação
    Wait Until Element Is Visible       //*[@id="columns"]//span[2][contains(text(),"Authentication")]

E preencho os campos obrigatórios
    Input Text          //*[@id="customer_firstname"]       Fulanoo
    Input Text          //*[@id="customer_lastname"]        Da Silvaa
    Input Password      passwd                              5689234
    Input Text          //*[@id="address1"]                 Rua Ciceros
    Input Text          //*[@id="city"]                     Nevada
    Click Element       //*[@id="id_state"]
    Select From List By Value        //*[@id="id_state"]        30
    Input Text          //*[@id="postcode"]                 89101
    Input Text          //*[@id="phone_mobile"]             1 702-385-4011
    Input Text          //*[@id="alias"]                    Home

E clico em "Register" para finalizar o registro
    Click Element       //*[@id="submitAccount"]/span[contains(text(),"Register")]

Quando sou redirecionada para página "My Account"
    Title Should Be           My account - My Store

Então visualizo a mensagem "${MENSAGEM_ALERTA}"
    Element Text Should Be      //*[@id="center_column"]/p[contains(text(),"${MENSAGEM_ALERTA}")]       ${MENSAGEM_ALERTA}


