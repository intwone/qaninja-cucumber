#language:pt

@greenFood @testing

Funcionalidade: Finalizar pedido
  Para que eu possa receber o pedido no meu endereço
  Sendo um usuário que fechou o carrinho com itens
  Posso finalizar o meu pedido

  # BDD (Desenvolvimento guiado por comportamento) => voltado para o negócio
  # BDT (Teste guiado por comportamento) 

  Cenario: Finalizar pedido com cartão refeição
    
    Dado que eu fechei o pedido com os itens:
      | quantidade  | nome                     | descricao                                   | subtotal   |
      | 1           | Suco Detox               | Suco de couve, cenoura, salsinha e maçã.    | "R$ 14,90" |
      | 2           | Hamburger de Quinoa      | Cheio de fibras e muito saboroso.           | "R$ 21,00" |
      | 1           | Salada Ceasar            | Clássica salada ceasar.                     | "R$ 33,90" |
    E informei os meus dados de entrega:
      | nome        | Cassio Oliveira Silva    |
      | email       | cassiointw1993@gmail.com |
      | rua         | Castro                   |
      | numero      | 144                      |
      | complemento | casa                     |
    Quando eu finalizo o pedido com "Cartão Refeição"
    Então devo ver a seguinte mensagem:
    """
    Seu pedido foi recebido pelo restaurante. Prepare a mesa que a comida está chegando!
    """

