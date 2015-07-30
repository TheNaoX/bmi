require 'rails_helper'

describe BodyMassIndex do
  let(:user) { create(:user) }
  describe "#calculate_body_mass_index" do
    subject { user.body_mass_indices.create(height: 1.77, weight: 89) }

    it "calculates the body mass index on create" do
      expect(subject.index).to eq 28.4
    end

    it "stores the category based on the index" do
      expect(subject.category).to eq "Overweight"
    end
  end
end
