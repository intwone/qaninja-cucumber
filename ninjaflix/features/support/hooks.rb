Before do
  # instanciamento das classes para utiliza-las globalmente
  @loginPage = LoginPage.new
  @moviePage = MoviePage.new
  @sideBar = SideBarView.new

  # verificar com a equipe de layout, qual a melhor opção a se utilizar
  # page.driver.browser.manage.window.maximize

  page.current_window.resize_to(1440, 900)
end

Before("@login") do
  # variavel para chamar as configurações de usuário
  user = CONFIG["users"]["catManager"]

  # chama o método goToApplication da classe LoginPage
  @loginPage.goToApplication

  # chama o método loginInPage passando o login de acesso para a aplicação
  @loginPage.loginInPage(user["email"], user["password"])
end
