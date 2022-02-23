# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

# def iteration
#   game_hash.map do |location, teams|
#     teams[:players].map do |stats|
#       stats[:slam_dunks]
#     end
#   end
# end

# puts iteration

def all_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def player_stats player_name
  all_players.find do |players|
    players[:player_name] == player_name
  end
end

def num_points_scored player_name
  player_stats(player_name)[:points]
end

def shoe_size player_name
  player_stats(player_name)[:shoe]
end

def find_team team_name
  team_info = game_hash.find do |location, teams|
    teams[:team_name] == team_name
  end
  team_info[1]
end

def team_colors team_name
  team = find_team(team_name)
  team[:colors]
end

def team_names
  game_hash.map do |location, teams|
    teams[:team_name]
  end
end

def player_numbers team_name
  team = find_team(team_name)
  team[:players].map do |stats|
    stats[:number]
  end
end

def big_shoe_player
  all_players.max_by do |player|
    player[:shoe]
  end
end

def big_shoe_rebounds
  big_shoe_player[:rebounds]
end

def most_points_scored
  player_most_points = all_players.max_by do |player|
    player[:points]
  end
  player_most_points[:player_name]
end

def winning_team
  home_scores = game_hash[:home][:players].map do |stats|
    stats[:points]
  end
  home_total_score = home_scores.sum
  away_scores = game_hash[:away][:players].map do |stats|
    stats[:points]
  end
  away_total_score = away_scores.sum
  if home_total_score > away_total_score
    game_hash[:home][:team_name]
  else game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  player_longest_name = all_players.max_by do |player|
    player[:player_name].length
  end
  player_longest_name[:player_name]
end

def long_name_steals_a_ton?
  player_longest_name = all_players.max_by do |player|
    player[:player_name].length
  end
  long_name_steals = player_longest_name[:steals]
  steals_array = all_players.map do |stats|
    stats[:steals]
  end
  find_steals = steals_array.find do |steals|
    long_name_steals < steals
  end
  if find_steals
    false
  else true
  end
end