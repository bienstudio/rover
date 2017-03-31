RSpec::Matchers.define :run_interaction do |command|
  match do |block|
    expect(command).to receive(:run!).with(@params).and_call_original

    block.call
  end

  chain :with do |params|
    @params = params
  end

  def supports_block_expectations?
    true
  end
end
