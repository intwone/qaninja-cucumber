Before do
  @loginPage = LoginPage.new
  @moviePage = MoviePage.new
  @sideBar = SideBarView.new
end

Before("@login") do
  @loginPage.goToApplication
  @loginPage.loginInPage("tony@stark.com", "pwd123")
end
