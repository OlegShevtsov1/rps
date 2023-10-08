module Games
  class PlayService
    OPTIONS = { rock: 'rock', paper: 'paper', scissors: 'scissors' }.freeze

    PLAYER_WINNER_CASES = [
      { 'player' => OPTIONS[:rock], 'computer' => OPTIONS[:scissors] },
      { 'player' => OPTIONS[:paper], 'computer' => OPTIONS[:rock] },
      { 'player' => OPTIONS[:scissors], 'computer' => OPTIONS[:paper] }
    ].freeze

    def initialize(player_option)
      @player_option = player_option
    end

    def call
      unless OPTIONS.map { |_key, value| value }.include?(@player_option)
        message = 'Your option is invalid, please use rules for more information'

        raise Errors::V1::CustomError.new(422, message)
      end

      populate_additional_options
      game_options_payload.merge(winner)
    end

    private

    def computer_option
      @computer_option ||= OPTIONS.map { |_key, value| value }.sample
    end

    def winner
      return { result: 'Computer and you have the same option' } if @player_option == computer_option
      return { result: 'Player is winner' } if player_winner?

      { result: 'Computer is winner' }
    end

    def player_winner?
      winner_cases = []

      player_winner_cases.each do |winner_case|
        winner_cases << true if winner_case['player'] == @player_option && winner_case['computer'] == computer_option
      end

      true if winner_cases.any?
    end

    def game_options_payload
      { player_option: @player_option, computer_option: computer_option }
    end

    def options
      options = OPTIONS.merge(@additional_options) if @additional_options.present?

      @options ||= options || OPTIONS
    end

    def player_winner_cases
      cases = PLAYER_WINNER_CASES + @additional_player_winner_cases if @additional_player_winner_cases.present?

      @player_winner_cases ||= cases || PLAYER_WINNER_CASES
    end

    def populate_additional_options
      return if ENV['ADDITIONAL_OPTIONS'].blank?

      begin
        json = JSON.parse(ENV.fetch('ADDITIONAL_OPTIONS', nil))
      rescue JSON::ParserError
        raise Errors::V1::CustomError.new(422, 'Invalid additional options format')
      end

      @additional_options = json.to_h { |option, _winner_cases| [option.downcase.to_sym, option.downcase] }
      @additional_player_winner_cases = additional_player_winner_cases(json)
    end

    def additional_player_winner_cases(json)
      winner_cases_result = []

      json.each do |option, computer_cases|
        computer_cases.each do |computer_case|
          winner_cases_result << { 'player' => option.downcase, 'computer' => computer_case.downcase }
        end
      end

      winner_cases_result
    end
  end
end
