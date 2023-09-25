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

  SCHEMA_ERROR= {
    type: :object,
    properties: {
      message: { type: :string },
    },
    required: %w(message)
  }.freeze
end
