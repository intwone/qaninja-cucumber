Dado("que {string} é um novo filme") do |movieCode|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
  @movie = file[movieCode]
  Database.new.deleteMovie(@movie["title"])
end

Quando("eu faço cadastro deste filme") do
  @moviePage.addNewMovie
  @moviePage.createMovie(@movie)
end

Então("devo ver o novo filme na lista") do
  movie = @moviePage.movieColumn(@movie)
  expect(movie).to have_text @movie["title"]
  expect(movie).to have_text @movie["status"]
end

Então("devo ver a notificação {string}") do |expectAlert|
  expect(@moviePage.alert).to eql expectAlert
end
