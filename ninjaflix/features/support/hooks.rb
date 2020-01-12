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

After do |scenario|
  #  pega as evidências somente se o cenário falhar
  #  if.scenario.failed?
  #   implementação...
  #  end

  tempShot = page.save_screenshot("log/temp_shot.png")

  # converte a screenshot para o formato base64
  screenshot = Base64.encode64(File.open(tempShot).read)

  # anexa um screenshot no relatório
  embed(screenshot, "image/png", "Screenshot")
end
