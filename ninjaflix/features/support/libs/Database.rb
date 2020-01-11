require "pg"

class Database
  def initialize
    # implementação para conexão ao banco de dados
    @dbConnection = PG.connect(CONFIG["database"])
  end

  def deleteMovie(title)
    query = "DELETE from public.movies where title = '#{title}';"

    # executa a query
    @dbConnection.exec(query)
  end

  def insertMovie(movie)
    query = "INSERT INTO public.movies (title, status, year, release_date, created_at, updated_at)" \
            " VALUES ('#{movie["title"]}', '#{movie["status"]}', '#{movie["year"]}', '#{movie["releaseDate"]}', current_timestamp, current_timestamp);"

    # executa a query
    @dbConnection.exec(query)
  end
end
