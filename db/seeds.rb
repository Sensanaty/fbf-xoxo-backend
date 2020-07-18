10.times do
  Score.create(username: Faker::Internet.username, wins: rand(1..500), draws: rand(1..500), losses: rand(1..500))
end

LocalScore.create(username: "Sensanaty", wins: 1500, draws: 1000, losses: 500)