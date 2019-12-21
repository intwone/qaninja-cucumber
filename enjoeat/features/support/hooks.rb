Before do
  page.current_window.resize_to(1440, 900)

  @restaurantMenuPage = RestaurantMenuPage.new
  @restaurantListPage = RestaurantListPage.new
  @cartPage = CartView.new
end

Before("@breadAndBakery") do
  visit "/restaurants/bread-bakery/menu"
end
