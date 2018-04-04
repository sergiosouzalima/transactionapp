class Mutations::CreateAdvisor < GraphQL::Function
  argument :id, types.ID
  argument :name, types.String
  argument :code, types.String

  type Types::AdvisorType # especificação do tipo de retorno

  def call(obj, args, context)
    Advisor.create(args.to_h)
  end
end
