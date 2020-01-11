class MoviePage
  include Capybara::DSL

  def movieAddView
    MovieAddView.new
  end

  def switchAlert
    SwitchAlert.new
  end

  # método para clicar no botão de adicionar um novo filme
  def addNewMovie
    find(".nc-simple-add").click
  end

  # método para busca a coluna desejada para validação do cenário
  def movieColumn(title)
    find("table tbody tr", text: title)
  end

  def remove(title)
    movieColumn(title).find(".btn-trash").click
  end

  def hasNoMovie(title)
    page.has_no_css?("table tbody tr", text: title)
  end

  def hasMovie(title)
    page.has_css?("table tbody tr", text: title)
  end
end
