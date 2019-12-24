class ValidationOrderPage
  include Capybara::DSL

  def fillUserData(user)
    find("input[formcontrolname=name]").set user[:nome]
    find("input[formcontrolname=email]").set user[:email]
    find("input[formcontrolname=emailConfirmation]").set user[:email]
    find("input[formcontrolname=address]").set user[:rua]
    find("input[formcontrolname=number]").set user[:numero]
    find("input[formcontrolname=optionalAddress]").set user[:complemento]
  end

  def selectPayment(payment)
    paymentOption = find("mt-radio[formcontrolname=paymentOption]")
    paymentOption.find("div", text: payment).find("div").click()
  end

  def checkOut(payment)
    self.selectPayment(payment)
    click_button "Finalizar Pedido"
  end

  def costShipping
    shipping = find("div[class*=col-sm-6]", text: "Frete e Total:")
    shipping.all("table tbody tr") # array[0: Itens, 1: Frete, 2: Total]
  end

  def summary
    find(".content")
  end
end
