class Game
  SCHEMA = {
    type: :object,
    properties: {
      player_option: { type: :string },
      computer_option: { type: :string },
      result: { type: :string },
    },
    required: %w(player_option computer_option result)
  }.freeze
end
