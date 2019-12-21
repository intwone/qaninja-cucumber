class RestaurantListPage
  include Capybara::DSL

  def loadPage
    visit "/restaurants"
  end

  def listRestaurant
    all(".restaurant-item")
  end

  def gotoRestaurant(restaurant)
    find(".restaurant-item", text: restaurant.upcase).click # passando como parâmetro os restaurantes
  end
end
