describe Rover::Models::Plan do
  let(:plan) { create(:plan) }

  it { expect(plan).to be_mongoid_document }

  it { expect(plan).to have_timestamps }

  it { expect(plan).to belong_to :trip }
end
