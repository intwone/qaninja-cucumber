require "base64"

Before do
  page.current_window.resize_to(1440, 900)

  @restaurantMenuPage = RestaurantMenuPage.new
  @restaurantListPage = RestaurantListPage.new
  @validationOrderPage = ValidationOrderPage.new
end

Before("@breadAndBakery") do
  visit "/restaurants/bread-bakery/menu"
end

Before("@greenFood") do
  visit "/restaurants/green-food/menu"
end

After do |scenario|
  if scenario.failed?
    screenShotFile = page.save_screenshot("log/screenshot.png")

    # transforma o arquivo para o tipo base64
    shot_b64 = Base64.encode64(File.open(screenShotFile, "rb").read)

    # anexa a screenshot no relatório
    embed(shot_b64, "image/png", "Screenshot")
  end
end
