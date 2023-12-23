require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#set_role" do
    context "when student" do
      let(:user) { build(:user, student: true) }
      it "should not be a tutor" do
        user.set_role
        expect(user.tutor?).to be false
      end

      it "should be a student" do
        user.set_role
        expect(user.student?).to be true
      end
    end

    context "when not student" do
      let(:user) { build(:user, student: false) }
      it "should be a tutor" do
        user.set_role
        expect(user.tutor?).to be true
      end

      it "should not be a student" do
        user.set_role
        expect(user.student?).to be false
      end
    end
  end
end
