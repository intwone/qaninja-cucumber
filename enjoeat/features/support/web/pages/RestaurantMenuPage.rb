class RestaurantMenuPage
  include Capybara::DSL

  def details
    find("#detail") # busca todos os elementos contidos na class ".detail"
  end

  def menuListRestaurant
    all(".menu-item-info-box") # seleciona todos os elementos que contém a div ".menu-item-info-box"
  end

  def addToCart(productName)
    find(".menu-item-info-box", text: productName.upcase).find(".add-to-cart").click
  end

  def cart
    CartView.new
  end
end
