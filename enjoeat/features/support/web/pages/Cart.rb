class Cart
  include Capybara::DSL

  def carBox
    find("#shopping-cart")
  end

  def totalCart
    carBox.find("tr", text: "Total:").find("td")
  end

  def removeItem(item)
    carBox.all("table tbody tr")[item].find(".danger").click # cart.all retorna todos os elementos
  end
end
