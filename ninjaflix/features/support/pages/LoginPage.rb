class LoginPage
  include Capybara::DSL

  def goToApplication
    visit "/"
  end

  def loginInPage(email, password)
    find("#emailId").set email
    find("#passId").set password
    click_button "Entrar"
  end

  def alertMessage
    find(".alert").text
  end
end
