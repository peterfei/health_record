Fabricator(:user) do
  user_vip
  truename {Faker::Name.name}
  sex {%w(male female).sample}
  age {Faker::Number.number(2)}
  wx_id {Faker::Internet.email}
  # houses(count: 2)
  # name { Faker::Name.name }
  # age 45
  # gender { %w(M F).sample }
end