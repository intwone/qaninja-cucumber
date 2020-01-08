Before do
  # instanciamento das classes para utiliza-las globalmente
  @loginPage = LoginPage.new
  @moviePage = MoviePage.new
  @sideBar = SideBarView.new
end

Before("@login") do
  # chama o método goToApplication da classe LoginPage
  @loginPage.goToApplication

  # chama o método loginInPage passando o login de acesso para a aplicação
  @loginPage.loginInPage("tony@stark.com", "pwd123")
end
