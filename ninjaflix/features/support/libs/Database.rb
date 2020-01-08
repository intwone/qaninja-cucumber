require "pg"

class Database
  def deleteMovie(title)
    # implementação para conexão ao banco de dados
    dbConnection = PG.connect(host: "localhost", dbname: "nflix", user: "postgres", password: "qaninja")

    query = "DELETE from public.movies where title = '#{title}';"

    # executa a query
    dbConnection.exec(query)
  end
end
