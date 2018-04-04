Types::AdvisorType = GraphQL::ObjectType.define do
  name "AdvisorType" # É como o schema irá identificar essa type.

  # Nesta parte informamos quais campos serão visíveis
  # numa consulta
  field :id, types.ID
  field :name, types.String
  field :code, types.String
end
