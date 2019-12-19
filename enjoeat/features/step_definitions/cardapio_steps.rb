Dado("que acesso a lista de restaurantes") do
  visit "/restaurants"
end

Quando("eu escolho o restaurante {string}") do |restaurante|
  find(".restaurant-item", text: restaurante.upcase).click # passando como parâmetro os restaurantes
end

Então("vejo os seguintes itens disponíveis no cardapío:") do |table|
  allItems = all(".menu-item-info-box") # seleciona todos os elementos que contém a div ".menu-item-info-box"

  productData = table.hashes # productData recebe a tabela da em formato de array[]

  productData.each_with_index do |value, index| # para cada item que vier da variável "allItems" faça:
    expect(allItems[index]).to have_text value["produto"].upcase # nome do produto é exibido em caixa alta na página
    expect(allItems[index]).to have_text value["descrição"]
    expect(allItems[index]).to have_text value["preço"]
  end
end

Então("eu vejo as seguintes informações adicionais") do |table|
  infos = table.rows_hash # row_hash: utilizado para tabelas do tipo chave-valor
  detail = find("#detail") # busca todos os elementos contidos na class ".detail"
  expect(detail).to have_text infos["categoria"]
  expect(detail).to have_text infos["descricao"]
  expect(detail).to have_text infos["horarios"]
end
