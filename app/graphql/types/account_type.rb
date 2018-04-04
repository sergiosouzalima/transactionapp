Types::AccountType = GraphQL::ObjectType.define do
  name "AccountType" # É como o schema irá identificar essa type.

  # Nesta parte informamos quais campos serão visíveis
  # numa consulta
  field :id, types.ID
  field :name, types.String
  field :email, types.String
  field :phone_number, types.String
  field :person_type, types.String
  field :advisor_id, types.Int

  # Vamos expor, não o código de Advisor,
  # mas todos dados de Conselheiros que estão no relacionamento
  # “account.advisor
  field :advisor do
    type Types::AdvisorType
    description "Conselheiro associado a esta conta"
    resolve ->(account, args, context){
      account.advisor
    }
  end
end
