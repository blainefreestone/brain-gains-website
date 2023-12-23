require 'rails_helper'

RSpec.describe Session, type: :model do
  let(:session) { build(:session) }

  context "with complete information" do
    it "should save" do
      expect(session.save).to be true
    end
  end
end
