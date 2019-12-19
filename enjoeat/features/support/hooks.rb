Before do
  page.current_window.resize_to(1440, 900)
end

Before("@breadAndBakery") do
  visit "/restaurants/bread-bakery/menu"
end
