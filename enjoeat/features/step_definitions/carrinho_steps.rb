Dado("que o produto desejado é {string}") do |produto|
  @productName = produto
end

Dado("o valor do produto é de {string}") do |valor|
  @productValue = valor
end

Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
  quantidade.times do
    @restaurantMenuPage.addToCart(@productName)
  end
end

Então("deve ser adicionado {int} unidade\\(s) deste item") do |quantidade|
  expect(@restaurantMenuPage.cart.carBox).to have_text "(#{quantidade}x) #{@productName}"
end

Então("o valor total deve ser de {string}") do |totalValue|
  expect(@restaurantMenuPage.cart.totalCart.text).to eql totalValue
end

# Lista de produtos

Dado("que os produtos desejados são:") do |table|
  @productList = table.hashes
end

Quando("eu adiciono todos os itens") do
  @productList.each do |produto| # para cada produto vindo da variável @productList, faça:
    produto["quantidade"].to_i.times do
      @restaurantMenuPage.addToCart(produto["nome"])
    end
  end
end

Então("eu vejo todos os itens no carrinho") do
  @productList.each do |produto| # para cada produto vindo da variável @productList, faça:
    expect(@restaurantMenuPage.cart.carBox).to have_text "(#{produto["quantidade"]}x) #{produto["nome"]}" # espero que na div "#cart" contenha o texto (1x produto)
  end
end

# Remover itens

Dado("que eu tenho os seguintes itens no carrinho:") do |table|
  @productList = table.hashes

  # dynamic step (steps compartilhados)
  steps %{
    Quando eu adiciono todos os itens
  }
end

Quando("eu removo somente o {int}") do |item|
  @restaurantMenuPage.cart.removeItem(item)
end

Quando("eu removo todos os itens") do
  @productList.each_with_index do |value, index| # para linha da tabela, pega-se o valor e indice do array[]
    @restaurantMenuPage.cart.removeItem(index)
  end
end

Quando("eu limpo o carrinho") do
  @restaurantMenuPage.cart.clearCart
end

Então("vejo a seguinte mensagem no carrinho {string}") do |mensagem|
  expect(@restaurantMenuPage.cart.carBox).to have_text mensagem
end

# concluindo a compra

Dado("que adicionei os seguintes itens no carrinho:") do |table|
  @productList = table.hashes

  steps %{
    Quando eu adiciono todos os itens
  }
end

Quando("fecho o meu carrinho") do
  @restaurantMenuPage.cart.closeOrder
end

Então("o valor deve constar um total de {string}") do |totalItems|
  expect(
    @validationOrderPage.costShipping[0]
  ).to have_text totalItems
end

Então("o valor do frete deve ser igual a {string}") do |shipping|
  expect(
    @validationOrderPage.costShipping[1]
  ).to have_text shipping
end

Então("o valor total da compra deve ser igual {string}") do |totalValue|
  expect(
    @validationOrderPage.costShipping[2]
  ).to have_text totalValue
end
