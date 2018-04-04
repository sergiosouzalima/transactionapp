Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createAdvisor, function: Mutations::CreateAdvisor.new
end
