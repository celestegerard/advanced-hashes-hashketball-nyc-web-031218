require "pry"

def game_hash
  game_hash = {
    home:{
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2,
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        }
      }
    }
  }
end


def num_points_scored(name)
  points = nil
  
  game_hash.each do |team, team_hash|
    game_hash[team][:players].each do |player_name, number|
      if name == player_name
        points = game_hash[team][:players][name][:points]
      end
    end
  end
  points
end

def shoe_size(name)
  size = nil
  
  game_hash.each do |team, team_hash|
    game_hash[team][:players].each do |player_name, number|
      if name == player_name
        size = game_hash[team][:players][name][:shoe]
      end
    end
  end
  size
end

def team_colors(team_name)
  colors = nil
  
  game_hash.each do |team, team_hash|
    if team_name == game_hash[team][:team_name]
    colors = game_hash[team][:colors]
    end
  end
colors
end


def team_names
  team_name = []
  
  game_hash.each do |team, team_hash|
    team_name.push(game_hash[team][:team_name])
  end
  team_name
end
  
def player_numbers(team_name)
  jersey_number_array= []
  
  game_hash.each do |team, team_hash|
    game_hash[team].each do |team_key, team_value|
      
      if team_value == team_name
        
        game_hash[team][:players].each do |key, value|
          game_hash[team][:players][key].each do |key1, value1|
            if key1 == :number
              jersey_number_array.push(value1)
            end
          end
        end
      end
    end
  end
  jersey_number_array
end


def player_stats(name)
  stats = {}
  
  game_hash.each do |team, team_hash|
    game_hash[team].each do |key, value|
      
      if key == :players
        game_hash[team][:players].each do |key1, value1|
          if name == key1
            stats = game_hash[team][:players][key1]
            end
          end
        end
      end
    end
  stats
end

def big_shoe_rebounds
  
  big_shoe_name = nil
  big_shoe = 0
  rebound = nil
  
  game_hash.each do |team, team_hash|
    game_hash[team].each do |team_key, team_value|
      if team_key  == :players
        game_hash[team][:players].each do |key, value|
          game_hash[team][:players][key].each do |key1, value1|
            if key1 == :shoe && value1 > big_shoe
              big_shoe = value1
              big_shoe_name = key
            end
          end
          if key == big_shoe_name
            rebound = game_hash[team][:players][key][:rebounds]
          end
        end
      end
    end
  end
  rebound
end

def get_team_total_shoe_size(team_hash)
  team_hash[:players].values.sum(&:shoe)
end

def total_shoe_sizes_of_entire_game(game_hash)
  game_hash.values.inject(0) do |acc, team_hash|
    get_team_total_shoe_size(team_hash)
  end
end
            
    
puts total_shoe_sizes_of_entire_game(game_hash) 


