#language:pt

@login
Funcionalidade: Cadastrar filmes
  Para que eu possa disponibilizar novos títulos no catálogo
  Sendo um gestor de catálogo
  Posso cadastrar um novo filmes

  @newMovie
  Esquema do Cenário: Novo filme
    O gestor de catálogo cadastra um novo filme através do formulário
    e um novo registro é inserido no catálogo Ninjaflix

    Dado que <codigo> é um novo filme
    Quando eu faço cadastro deste filme
    Então devo ver o novo filme na lista

    Exemplos: 
      | codigo      |
      | "ultimato"  |
      | "spider"    |
      | "jocker"    |


