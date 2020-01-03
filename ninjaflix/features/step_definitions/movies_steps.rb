Dado("que {string} é um novo filme") do |movieCode|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
  @movie = file[movieCode]
  puts @movie
end

Quando("eu faç o cadastro deste filme") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("devo ver o novo filme na lista") do
  pending # Write code here that turns the phrase above into concrete actions
end
