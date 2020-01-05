Quando("eu faço o login com {string} e {string}") do |email, password|
  @loginPage.goToApplication
  @loginPage.loginInPage(email, password)
end

Então("devo ser autenticado") do
  expect(getToken.length).to be 147
end

Então("devo ver {string} na area logada") do |username|
  @sideBar = SideBarView.new
  expect(@sideBar.loggedUser).to eql username
end

# Login sem sucesso

Então("não devo ser autenticado") do
  expect(getToken).to be nil
end

Então("devo ver a mensagem de alerta {string}") do |alert|
  expect(@loginPage.alertMessage).to eql alert
end
