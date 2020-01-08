class LoginPage
  include Capybara::DSL

  # método para visitar a página raiz do projeto (login)
  def goToApplication
    visit "/"
  end

  # método para logar na aplicação
  def loginInPage(email, password)
    find("#emailId").set email
    find("#passId").set password
    click_button "Entrar"
  end

  # método que busca uma mensagem de alerta caso o login seja inválido
  def alertMessage
    find(".alert").text
  end
end
