#language: pt

Funcionalidade: Restaurantes
  Para que eu possa saber quais os restaurantes disponíveis com o tempo de entrega e nota de avaliação
  Sendo um usuário que deseja pedir comida
  Posso acessar a lista de restaurantes

  Cenario: Restaurantes disponíveis
    Dado que temos os seguintes restaurantes
      | nome              | categoria     | entrega       | avaliação |
      | Bread & Bakery    | Padaria       | 25 minutos    | 4.9       |
      | Burger House      | Hamburgers    | 30 minutos    | 3.5       |
      | Coffee Corner     | Cafeteria     | 20 minutos    | 4.8       |

    Quando acesso a lista de restaurantes
    Então devo ver todos os restaurantes desta lista


# -------------- OLD VERSION --------------
# Contexto: Lista de restaurantes
#     Dado que tenho uma lista de restaurantes

#   Cenario: Todos os restaurantes
#     Quando acesso a lista de restaurantes
#     Então vejo todas as opções disponíveis
  
#   Cenario: Categorias
#     Quando acesso a lista de restaurantes
#     Então cada restaurante deve exibir sua categoria

#   Cenario: Tempo de entrega
#     Quando acesso a lista de restaurantes
#     Então cada restaurante deve exibir o tempo de entrega

#   Cenario: Nota de avaliação
#     Quando acesso a lista de restaurantes
#     Então cada restaurante deve exibir sua nota de avaliação


# Esquema do Cenario: Restaurantes disponíveis
#   Quando acesso a lista de restaurantes
#   Então cada restaurante deve ter <id> <nome> <categoria> <entrega> <avaliação>

#   Exemplos:
#     | id | nome             | categoria    | entrega      | avaliação |
#     | 0  | "Bread & Bakery" | "Padaria"    | "25 minutos" | 4.9       |
#     | 1  | "Burger House"   | "Hamburgers" | "30 minutos" | 3.5       |
#     | 2  | "Coffee Corner"  | "Cafeteria"  | "20 minutos" | 4.8       |
