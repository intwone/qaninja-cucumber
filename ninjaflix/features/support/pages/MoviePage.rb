class MoviePage
  include Capybara::DSL

  # método para clicar no botão de adicionar um novo filme
  def addNewMovie
    find(".nc-simple-add").click
  end

  # método que realiza o upload de imagens na aplicação
  def uploadImage(file)
    coverFile = File.join(Dir.pwd, "features/support/fixtures/cover/" + file)

    coverFile = coverFile.tr("/", "\\") if OS.windows?

    Capybara.ignore_hidden_elements = false
    attach_file("upcover", coverFile) # attach_file: capybara code
    Capybara.ignore_hidden_elements = true
  end

  # método para adicionar o elenco do filme
  def addCast(cast)
    actor = find(".input-new-tag")
    cast.each do |iteration|
      actor.set iteration
      actor.send_keys :tab
    end
  end

  def selectStatus(status)
    find("input[placeholder=Status]").click
    find(".el-select-dropdown__item", text: status).click
  end

  # método para preencher todos os campos necessários para adicionar um filme
  def createMovie(movie)
    find("input[name=title]").set movie["title"]

    # se movie["status"] retornar false, a mesma está vazia (não seleciona o status do movie)
    selectStatus(movie["status"]) unless movie["status"].empty?

    find("input[name=year]").set movie["year"]

    find("input[name=release_date]").set movie["realeaseDate"]

    addCast(movie["cast"])

    find("textarea[name=overview]").set movie["overview"]

    # se movie["cover"] retornar false, a mesma está vazia (não executa o upload de imagens)
    uploadImage(movie["cover"]) unless movie["cover"].empty?

    find("#create-movie").click
  end

  # método para busca a coluna desejada para validação do cenário
  def movieColumn(movie)
    find("table tbody tr", text: movie["title"])
  end

  # método para buscar o texto contido na classe alert
  def alert
    find(".alert").text
  end
end
