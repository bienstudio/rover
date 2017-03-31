class DumbInteraction < Rover::Interactions::Base
  boolean :should_fail, default: false

  def execute
    if should_fail
      errors.add(:foo, 'bar')
    end
  end
end

describe Rover::Interactions::Base do
  it 'subclasses from ActiveInteraction::Base' do
    expect(Rover::Interactions::Base).to be < ActiveInteraction::Base
  end

  describe '#run!' do
    it 'runs the interaction' do
      interaction = DumbInteraction.new

      expect(interaction).to receive :run

      interaction.run!
    end

    it 'raises an invalid request error' do
      expect { DumbInteraction.run!(should_fail: true) }.to raise_error Rover::Errors::InvalidRequest
    end
  end
end
