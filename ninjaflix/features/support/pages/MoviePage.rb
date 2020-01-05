class MoviePage
  include Capybara::DSL

  def addNewMovie
    find(".nc-simple-add").click
  end

  def uplaodImage(file)
    coverFile = File.join(Dir.pwd, "features/support/fixtures/cover/" + movie["cover"])

    coverFile = coverFile.tr("/", "\\") if OS.windows?

    Capybara.ignore_hidden_elements = false
    attach_file("upcover", coverFile)
    Capybara.ignore_hidden_elements = true
  end

  def addCast(cast)
    actor = find(".input-new-tag")
    cast.each do |iteration|
      actor.set iteration
      actor.send_keys :tab
    end
  end

  def createMovie(movie)
    find("input[name=title]").set movie["title"]
    find("input[placeholder=Status]").click
    find(".el-select-dropdown__item", text: movie["status"]).click
    find("input[name=year]").set movie["year"]
    find("input[name=release_date]").set movie["realeaseDate"]

    addCast(movie["cast"])

    find("textarea[name=overview]").set movie["overview"]

    uplaodImage(movie["cover"])
  end
end
