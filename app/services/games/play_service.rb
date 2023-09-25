module Games
  class PlayService
    OPTIONS = { rock: 'rock', paper: 'paper', scissors: 'scissors' }.freeze

    def initialize(player_option)
      @player_option = player_option
    end

    def call
      unless OPTIONS.map { |_key, value| value }.include?(@player_option)
        message = 'Your option is invalid, please use rules for more information'

        raise Errors::V1::CustomError.new(422, message)
      end

      options_payload.merge(winner)
    end

    private

    def computer_option
      @_computer_option ||= OPTIONS.map { |_key, value| value }.sample
    end

    def winner
      case [@player_option, computer_option]
      # TODO: add rules in case of additional options
      when [options[:rock], options[:scissors]], [options[:paper], options[:rock]], [options[:scissors], options[:paper]]
        { result: 'Player is winner' }
      when [options[:rock], options[:paper]], [options[:paper], options[:scissors]], [options[:scissors], options[:rock]]
        { result: 'Computer is winner' }
      else
        { result: 'Computer and you have the same option' }
      end
    end

    def options_payload
      { player_option: @player_option, computer_option: computer_option }
    end

    def options
      @_options = OPTIONS.merge(additional_options)
    end

    def additional_options
      return unless ENV['ADDITIONAL_OPTIONS'].present?

      ENV['ADDITIONAL_OPTIONS'].split(',').map { |option| [option, option] }.to_h
    end
  end
end
