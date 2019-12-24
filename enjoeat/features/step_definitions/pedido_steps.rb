Dado("que eu fechei o pedido com os itens:") do |table|
  @productList = table.hashes

  steps %{
    Quando eu adiciono todos os itens
  }

  @restaurantMenuPage.cart.closeOrder
end

Dado("informei os meus dados de entrega:") do |table|
  user = table.rows_hash

  @validationOrderPage.fillUserData(user)
end

Quando("eu finalizo o pedido com {string}") do |payment|
  @validationOrderPage.checkOut(payment)
end

Então("devo ver a seguinte mensagem:") do |message|
  expect(@validationOrderPage.summary).to have_text message
end
