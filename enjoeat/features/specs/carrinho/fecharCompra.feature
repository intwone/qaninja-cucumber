#language:pt

@greenFood

Funcionalidade: Fechar carrinho
  Para que eu possa concluir a compra
  Sendo um usuário que adicionou itens desejados ao carrinho
  Posso fechar a compra

  Cenario: Valor total e frete

    Dado que adicionei os seguintes itens no carrinho:
      | quantidade | nome                   | descricao                                   | subtotal    |
      | 1          | Suco Detox             | Suco de couve, cenoura, salsinha e maçã.    | R$ 14,90    |
      | 2          | Hamburger de Quinoa    | Cheio de fibras e muito saboroso.           | R$ 21,00    |
    Quando fecho o meu carrinho
    Então o valor deve constar um total de "R$ 35,90"
    E o valor do frete deve ser igual a "R$ 8,00"
    E o valor total da compra deve ser igual "R$ 43,90"