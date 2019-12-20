Dado("que o produto desejado é {string}") do |produto|
  @productName = produto
end

Dado("o valor do produto é de {string}") do |valor|
  @productValue = valor
end

Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
  quantidade.times do
    find(".menu-item-info-box", text: @productName.upcase).find(".add-to-cart").click
  end
end

Então("deve ser adicionado {int} unidade\\(s) deste item") do |quantidade|
  cart = find("#cart")
  expect(cart).to have_text "(#{quantidade}x) #{@productName}"
end

Então("o valor total deve ser de {string}") do |totalValue|
  cart = find("#cart")
  total = cart.find("tr", text: "Total:").find("td")
  expect(total.text).to eql totalValue
end

# Lista de produtos

Dado("que os produtos desejados são:") do |table|
  @productList = table.hashes
end

Quando("eu adiciono todos os itens") do
  @productList.each do |produto| # para cada produto vindo da variável @productList, faça:
    produto["quantidade"].to_i.times do
      find(".menu-item-info-box", text: produto["nome"].upcase).find(".add-to-cart").click
    end
  end
end

Então("eu vejo todos os itens no carrinho") do
  cart = find("#cart") # div pai que engloba todos os itens adicionados
  @productList.each do |produto| # para cada produto vindo da variável @productList, faça:
    expect(cart).to have_text "(#{produto["quantidade"]}x) #{produto["nome"]}" # espero que na div "#cart" contenha o texto (1x produto)
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
  cart = find("#cart")
  cart.all("table tbody tr")[item].find(".danger").click # cart.all retorna todos os elementos
end

Quando("eu removo todos os itens") do
  @productList.each_with_index do |value, index| # para linha da tabela, pega-se o valor e indice do array[]
    cart = find("#cart")
    cart.all("table tbody tr")[index].find(".danger").click # o valor do index [0 1 2] para cada click no item
  end
end

Quando("eu limpo o carrinho") do
  clearButton = find("#cart button").click
end

Então("vejo a seguinte mensagem no carrinho {string}") do |mensagem|
  cart = find("#cart") # ou podemos utilizar o método click_button "texto_do_button"
  expect(cart).to have_text mensagem
end
