Dado("que {string} é um novo filme") do |movieCode|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
  @movie = file[movieCode]
  Database.new.deleteMovie(@movie["title"])
end

Dado("este filme já existe no catálogo") do
  Database.new.insertMovie(@movie)
end

Quando("eu faço cadastro deste filme") do
  @moviePage.addNewMovie
  @moviePage.movieAddView.createMovie(@movie)
  sleep 5
end

Então("devo ver o novo filme na lista") do
  movie = @moviePage.movieColumn(@movie["title"])
  expect(movie).to have_text @movie["title"]
  expect(movie).to have_text @movie["status"]
end

Então("devo ver a notificação {string}") do |expectAlert|
  expect(@moviePage.movieAddView.alert).to eql expectAlert
  sleep 5
end

Dado("que {string} está no catálogo") do |movieCode|
  steps %{
    Dado que "#{movieCode}" é um novo filme
    E este filme já existe no catálogo
  }
end

Quando("eu solicito a exclusão") do
  @moviePage.remove(@movie["title"])
end

Quando("eu confirmo a solicitação") do
  @moviePage.switchAlert.alertConfirm
end

Então("este item deve ser removido do catálogo") do
  expect(@moviePage.hasNoMovie(@movie["title"])).to be true
end

Quando("cancelo a solicitação") do
  @moviePage.switchAlert.alertCancel
end

Então("este item deve permanecer no catálogo") do
  expect(@moviePage.hasMovie(@movie["title"])).to be true
end
