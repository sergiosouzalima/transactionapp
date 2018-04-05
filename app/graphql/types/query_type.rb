Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  # chamamos o field de "transaction" e ele terá um
  # namespace chamado "Types" que chamamos
  # de "TransactionType" e ficará em
  # app/graphql/types/transaction_type.rb
  field :transaction, Types::TransactionType do
    # passamos aqui o "id" do Transaction como argumento de consulta
    # esse valor de "id" vem do front-end para o back-end
    argument :id, types.ID
    description "Identificação da Transação"

    # aqui é o método chamado "resolve" que resgata
    # os dados de Transaction do banco de dados
    resolve -> (obj, args, ctx) {
      Transaction.where(id: args[:id]).first
    }
  end

  field :allTransactions, types[Types::TransactionType] do
    description "Retorna todas Transações"
    argument :equity, types.String

    resolve -> (obj, args, ctx) {
      return Transaction.all unless args[:equity]
      Transaction.where('equity like ?', "%#{args[:equity]}%")
    }
  end

  field :allAdvisors, types[Types::AdvisorType] do
    description "Retorna todos Conselheiros"
    argument :name, types.String

    resolve -> (obj, args, ctx) {
      return Advisor.all.reverse unless args[:name]
      Advisor.where('name like ?', "%#{args[:name]}%").reverse
    }
  end

  field :allAccounts, types[Types::AccountType] do
    description "Retorna todas Contas"
    argument :name, types.String

    resolve -> (obj, args, ctx) {
      return Account.all.reverse unless args[:name]
      Account.where('name like ?', "%#{args[:name]}%")
    }
  end
end
