Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  # chamamos o field de "transaction" e ele terá um
  # namespace chamado "Types" que chamamos
  # de "TransactionType" e ficará em
  # app/graphql/types/transaction_type.rb
  field :transaction, Types::TransactionType do
    # passamos aqui o "id" do Transaction como argumento de consulta
    # esse valor de "id" vem do front-end para o back-end
    argument :id, types.ID # o "id" tem um tipo especial chamado ID
    description "Identificação da Transação"

    # aqui é o método chamado "resolve" que resgata
    # os dados de Transaction do banco de dados
    resolve -> (obj, args, ctx) {
      Transaction.where(id: args[:id]).first
    }
  end

  field :allTransactions, types[Types::TransactionType] do
    description "Retorna todas Transações"

    resolve -> (obj, args, ctx) {
      Transaction.all
    }
  end

  field :allAdvisors, types[Types::AdvisorType] do
    description "Retorna todos os Conselheiros"

    resolve -> (obj, args, ctx) {
      Advisor.all.reverse
    }
  end
end
