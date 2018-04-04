Types::TransactionType = GraphQL::ObjectType.define do
  name "TransactionType" # É como o schema irá identificar essa type.

  # Nesta parte informamos quais campos serão visíveis
  # numa consulta
  field :id, types.ID
  field :equity, types.String
  field :kind, types.String
  field :value, types.Int
  field :transaction_at, types.String
  field :account_id, types.Int

  # Vamos expor, não o código de Account,
  # mas todos dados de Account que estão no relacionamento
  # “transaction.account
  field :account do
    type Types::AccountType
    description "Conta associada a esta transação"
    resolve ->(transaction, args, context){
      transaction.account
    }
  end
end
