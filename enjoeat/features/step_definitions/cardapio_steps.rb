Dado("que acesso a lista de restaurantes") do
  @restaurantListPage.loadPage
end

Quando("eu escolho o restaurante {string}") do |restaurante|
  @restaurantListPage.gotoRestaurant(restaurante)
end

Então("vejo os seguintes itens disponíveis no cardapío:") do |table|
  allItems = @restaurantMenuPage.menuListRestaurant

  productData = table.hashes # productData recebe a tabela da em formato de array[]

  productData.each_with_index do |value, index| # para cada item que vier da variável "allItems" faça:
    expect(allItems[index]).to have_text value["produto"].upcase # nome do produto é exibido em caixa alta na página
    expect(allItems[index]).to have_text value["descrição"]
    expect(allItems[index]).to have_text value["preço"]
  end
end

Então("eu vejo as seguintes informações adicionais") do |table|
  infos = table.rows_hash # row_hash: utilizado para tabelas do tipo chave-valor
  detail = @restaurantMenuPage.details
  expect(detail).to have_text infos["categoria"]
  expect(detail).to have_text infos["descricao"]
  expect(detail).to have_text infos["horarios"]
end
