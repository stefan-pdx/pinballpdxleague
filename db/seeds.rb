require 'faker'

league = League::Tournament.create(
    name: "PDX Summer 2019",
    start_date: "2019-07-06",
    end_date: "2019-08-20"
)

16.times do
    team = Team.create(name: Faker::Team.name)

    10.times do
        player = Player.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
        )

        team.players << player
    end

    league.teams << team
end

3.times do |n|
    league.matches << Match.new(start_time: league.start_date + n.weeks, match_number: n+1)

    match = league.matches.last

    league.teams.shuffle.in_groups_of(2) do |home_team, away_team|
        match.lineups << Lineup.new(
            first_team: home_team, 
            second_team: away_team
        )
    end
end

stefan = User.create(
    email: 'stefan@example.com',
    password: 'password',
    password_confirmation: 'password'
)

Player.first.update(user: stefan, first_name: "Stefan")

50.times do
    Machine.create(name: Faker::Game.title)
end