#language:pt

@login
Funcionalidade: Cadastrar filmes
  Para que eu possa disponibilizar novos títulos no catálogo
  Sendo um gestor de catálogo
  Posso cadastrar um novo filmes

  @newMovie
  Esquema do Cenário: Novo filme
    O gestor de catálogo cadastra um novo filme através do formulário
    e um novo registro é inserido no catálogo Ninjaflix.

    Dado que <codigo> é um novo filme
    Quando eu faço cadastro deste filme
    Então devo ver o novo filme na lista

    Exemplos: 
      | codigo      |
      | "ultimato"  |
      | "spider"    |
      | "jocker"    |

  @attemptMovie
  Esquema do Cenário: Campos obrigatórios
    O gestor de catalogos tenta cadastrar um novo filme, mas esquece
    de preencher um dos campos que são obrigatórios, em seguida, o sistema
    exibe uma notificação para o usuário.

    Dado que <codigo> é um novo filme
    Quando eu faço cadastro deste filme
    Então devo ver a notificação <texto>

    Exemplos: 
      | codigo                 | texto                                           |
      | "noTitle"              | "Oops - Filme sem titulo. Pode isso Arnaldo?"   |
      | "noStatus"             | "Oops - O status deve ser informado!"           |
      | "noYear"               | "Oops - Faltou o ano de lançamento também!"     |
      | "noRealeaseDate"       | "Oops - Quase lá, só falta a data de estréia!"  |

  @dupMovie
  Cenário: Duplicado
    O gestor de catálogo tenta cadastrar um filme, porém o título 
    já foi cadastrado em outro momento e o sistema notifica o usuário
    informando que o título já existe.

    Dado que "deadpool2" é um novo filme
    Mas este filme já existe no catálogo
    Quando eu faço cadastro deste filme
    Então devo ver a notificação "Oops - Este titulo já existe no Ninjaflix."