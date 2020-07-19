5.times do
  Score.create(username: Faker::Internet.username, wins: rand(1..500), draws: rand(1..500), losses: rand(1..500))
end
