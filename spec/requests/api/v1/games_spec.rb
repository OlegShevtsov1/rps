require 'swagger_helper'
require 'schemas/game'

RSpec.describe 'Game' do
  let(:player_option) { 'rock' }
  let(:computer_option) { 'scissors' }
  let(:result) { { result: 'Player is winner' } }
  let(:response_data) do
    result.merge(player_option: player_option, computer_option: computer_option).with_indifferent_access
  end

  path '/v1/games' do
    post 'Get result of game' do
      tags 'Game'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :player_option, in: :query, type: :string

      response '200', 'Game' do
        schema_data_obj Game::SCHEMA

        before { allow_any_instance_of(Array).to receive(:sample).and_return(computer_option) }

        run_test_with_example! do
          expect(json_response['data']).to eq(response_data)
        end
      end

      response '422', 'Unprocessable' do
        let(:player_option) { 'invalid_option' }

        run_test_with_example! do
          expect(json_response['message']).to eq('Your option is invalid, please use rules for more information')
        end
      end
    end
  end
end
