require 'rails_helper'

RSpec.describe Engagement, type: :model do
  context "with both student and tutor" do
    let(:engagement) { build(:engagement, tutor: build(:tutor)) }

    it "should save" do
      expect(engagement.save).to be true
    end

    it "should have student" do
      expect(engagement.student.student?).to be true
    end

    it "should have tutor" do
      expect(engagement.tutor.tutor?).to be true
    end

    it "should not save when tutor has role student" do
      engagement = build(:engagement, tutor: build(:student))
      expect(engagement.save).to be false
    end

    it "should not save when student has role tutor" do
      engagement = build(:engagement, tutor: build(:tutor), student: build(:tutor))
      expect(engagement.save).to be false
    end
  end

  context "with no tutor" do
    let(:engagement) { build(:engagement) }

    it "should save" do
      expect(engagement.save).to be true
    end

    it "should have student" do
      expect(engagement.student.student?).to be true
    end
  end

  context "with no student" do
    let (:engagement) { build(:engagement, student: nil) }

    it "should not save" do
      expect(engagement.save).to be false
    end
  end
end
