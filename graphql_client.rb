#
# graphql_client.rb
#
require 'graphlient'

url = 'http://ubuntu-sergiosouzalima980040.codeanyapp.com:3000/graphql'
client = Graphlient::Client.new(url)

# The schema is available automatically via .schema.
client.schema # GraphQL::Schema

response = client.query do
  query do
    transaction(id: 899) do
      equity
      account do
        email
        name
      end
    end
  end
end

puts response.data.transaction.account.name
puts response.data.transaction.account.email
