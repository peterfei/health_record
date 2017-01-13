Fabricator(:user_vip) do
  card_number {Faker::Number.number(12)}
  # houses(count: 2)
  # name { Faker::Name.name }
  # age 45
  # gender { %w(M F).sample }
end