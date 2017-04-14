require './lib/bike.rb'

describe Bike do
  it { is_expected.to respond_to(:broken) }
  it { is_expected.to respond_to(:report_broken) }
  it "Returns false as default when passed the broken method" do
    expect(subject.broken).to eq false
  end

  describe '#broken' do
      it "returns true if bike.report_broken has been run" do
        subject.report_broken
        expect(subject.broken).to eq true
      end
  end
end
