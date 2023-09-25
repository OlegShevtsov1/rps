RSpec.describe Games::PlayService, type: :service do
  let(:player_option) { 'rock' }
  let(:computer_option) { 'scissors' }
  let(:data) { result.merge(player_option: player_option, computer_option: computer_option) }
  let(:result) { { result: 'Player is winner' } }

  describe '#call' do
    subject { described_class.new(player_option).call }

    context 'when player is winner' do
      # TODO: it could be described every options are possible but I leave it for now
      it do
        allow_any_instance_of(Array).to receive(:sample).and_return(computer_option)

        is_expected.to eq data
      end
    end

    context 'when computer is winner' do
      let(:computer_option) { 'paper' }
      let(:result) { { result: 'Computer is winner' } }

      it do
        allow_any_instance_of(Array).to receive(:sample).and_return(computer_option)

        is_expected.to eq data
      end
    end

    context 'when the same option' do
      let(:computer_option) { 'rock' }
      let(:result) { { result: 'Computer and you have the same option' } }

      it do
        allow_any_instance_of(Array).to receive(:sample).and_return(computer_option)

        is_expected.to eq data
      end
    end

    context 'when invalid option' do
      let(:player_option) { 'invalid' }
      let(:error_message) { 'Your option is invalid, please use rules for more information' }

      it { expect { subject }.to raise_error(Errors::V1::CustomError, error_message) }
    end
  end
end
