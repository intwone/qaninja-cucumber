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
  click_button "Limpar"
end

Então("vejo a seguinte mensagem no carrinho {string}") do |mensagem|
  expect(@restaurantMenuPage.cart.carBox).to have_text mensagem
end
