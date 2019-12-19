#language:pt

Funcionalidade: Qual é o prato do dia
  Queremos saber qual o prato do dia na capital paulista

  Esquema do Cenario: Prato do dia

    Dado que hoje é <dia>
    Quando eu pergunto qual é o prato do dia
    Então a resposta deve ser <resposta>

    Exemplos:
    | dia             | resposta            |
    | "segunda-feira" | "Virado a Paulista" |
    | "terça-feira"   | "Dobradinha"        | 
    | "quarta-feira"  | "Feijoada"          |
    | "quinta-feira"  | "Macarronada"       |
    | "sexta-feira"   | "Filé de Merluza"   |
    | "sábado"        | "Veja o Cardápio"   |
    | "domingo"       | "Fechado"           |
    | "xpto"          | "Dia inválido"      |
    | "abc132"        | "Dia inválido"      |
      