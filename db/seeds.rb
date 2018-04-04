puts '####### deleting all Transactions'
Transaction.delete_all

puts '####### deleting all Accounts'
Account.delete_all

puts '####### deleting all Advisors'
Advisor.delete_all

puts '####### creating Advisors'
100.times do |index|
  Advisor.create!(name: Faker::Name.name_with_middle, code: Faker::Code.asin)
end

puts '####### creating Accounts'
1000.times do |index|
  Account.create!(name: Faker::Name.name_with_middle, email: Faker::Internet.email,
                  phone_number: Faker::PhoneNumber.cell_phone,
                  person_type: ['F','J'].sample,
                  advisor_id: Advisor.pluck(:id).sample)
end

puts '####### creating Transactions'
open("db/fixtures/equities.txt") do |equities|
  equities.read.each_line do |line|
    equity = line.chomp
    Transaction.create!(equity: equity, kind: ['C','V'].sample,
                        value: Faker::Number.decimal(2),
                        transaction_at: Faker::Date.backward(30),
                        account_id: Account.pluck(:id).sample)
  end
end
puts '####### done.'
