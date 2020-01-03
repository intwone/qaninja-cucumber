#language:pt

Funcionalidade: Login
  Para que eu possa gerenciar os filmes do catalogo ninjaflix
  Sendo um usuário previamente cadastrado
  Posso acessar o sistema com o meu e-mail e senha

  @loginSuccess
  Cenario: Acesso
    Quando eu faço o login com "tony@stark.com" e "pwd123"
    Então devo ser autenticado 
    E devo ver "Tony Stark" na area logada

  @loginUnsuccessfully
  Esquema do Cenario: Login sem sucesso
    Quando eu faço o login com <email> e <senha>
    Então não devo ser autenticado
    E devo ver a mensagem de alerta <texto>

    Exemplos:
      | email             | senha    | texto                          |
      | "tony@stark.com"  | "abc123" | "Usuário e/ou senha inválidos" |
      | "404@yahoo.com"   | "abc123" | "Usuário e/ou senha inválidos" |
      | ""                | "abc123" | "Opps. Cadê o email?"          |
      | "teste@gmail.com" | ""       | "Opps. Cadê a senha?"          |
