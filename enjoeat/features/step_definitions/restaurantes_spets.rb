Dado("que temos os seguintes restaurantes") do |table|
  @restaurantData = table.hashes # hashes transforma a tabela "restaurants" no formato de array[]
end

Quando("acesso a lista de restaurantes") do
  # Abre o browser na página desejada
  @restaurantListPage.loadPage
end

Então("devo ver todos os restaurantes desta lista") do
  restaurants = @restaurantListPage.listRestaurant

  @restaurantData.each_with_index do |value, index|
    expect(restaurants[index]).to have_text value["nome"].upcase
    expect(restaurants[index]).to have_text value["categoria"]
    expect(restaurants[index]).to have_text value["entrega"]
    expect(restaurants[index]).to have_text value["avaliação"]
  end
end

# -------------- OLD VERSION --------------

# Dado("que tenho uma lista de restaurantes") do
#   @restaurantData = [
#     # Massa de testes com todos os restaurantes
#     { name: "Brad & Bakery", category: "Padaria", timeDelivery: "25 minutos", rating: 4.9 },
#     { name: "Burger House", category: "Hamburgers", timeDelivery: "30 minutos", rating: 3.5 },
#     { name: "Coffee Corner", category: "Cafeteria", timeDelivery: "20 minutos", rating: 4.8 },
#   ]
# end

# Então("vejo todas as opções disponíveis") do
#   # Busca todos os elementos que contém a classe "restaurant-item"
#   restaurants = all(".restaurant-item")

#   # Esperado que a quantidade de elementos da variável restaurants (array[5]) seja maior que 0 (zero)
#   expect(restaurants.size).to be > 0

#   # Retorna a quantidade de items encontrados na variável restaurants
#   # puts restaurants.size

#   # Retorna o tipo do elemento
#   # puts restaurants.class

#   # Esperado que a quantidade de elementos da variável restaurants seja igual a 6 (seis) - não recomendado
#   # expect(restaurants.size).to eql 6
# end

# Então("cada restaurante deve exibir sua categoria") do
#   allRestaurants = all(".restaurant-item")

#   @restaurantData.each_with_index do |value, index| # para cada objeto dentro do array "restaurantData" faça:
#     expect(allRestaurants[index]).to have_text value[:category]
#   end
# end

# Então("cada restaurante deve exibir o tempo de entrega") do
#   allRestaurants = all(".restaurant-item")

#   @restaurantData.each_with_index do |value, index| # para cada objeto dentro do array "restaurantData" faça:
#     expect(allRestaurants[index]).to have_text value[:timeDelivery]
#   end
# end

# Então("cada restaurante deve exibir sua nota de avaliação") do
#   allRestaurants = all(".restaurant-item")

#   @restaurantData.each_with_index do |value, index| # para cada objeto dentro do array "restaurantData" faça:
#     expect(allRestaurants[index]).to have_text value[:rating]
#   end
# end

# Então("cada restaurante deve ter {int} {string} {string} {string} {float}") do |id, name, category, timeDelivery, rating|
#   allRestaurants = all(".restaurant-item")

#   expect(allRestaurants[id]).to have_text name.upcase
#   expect(allRestaurants[id]).to have_text category
#   expect(allRestaurants[id]).to have_text timeDelivery
#   expect(allRestaurants[id]).to have_text rating
# end
