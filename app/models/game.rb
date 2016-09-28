class Game < ApplicationRecord
  belongs_to :opponent, class_name: 'User', optional: true, foreign_key: "opponent_id"
  belongs_to :player, class_name: 'User', optional: true, foreign_key: "player_id"
end
