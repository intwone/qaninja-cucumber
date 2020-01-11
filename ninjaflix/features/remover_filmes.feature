#language:pt

@removeMovie @login
Funcionalidade: Remover filme
  Para que eu possa manter o catálogo atualizado
  Sendo um gestor de catálogo que encontrou um título cancelado/indesejado
  Posso remover este item

  @removeMovie
  Cenário: Confirmar exclusão
    Dado que "dbz" está no catálogo
    Quando eu solicito a exclusão
    E eu confirmo a solicitação
    Então este item deve ser removido do catálogo

  @cancelRemove
  Cenário: Cancelar exclusão
    Dado que "tenThings" está no catálogo
    Quando eu solicito a exclusão
    Mas cancelo a solicitação
    Então este item deve permanecer no catálogo