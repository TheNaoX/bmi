class BodyMassIndex < ActiveRecord::Base
  belongs_to :user

  validates :height, :weight,
    presence: true,
    numericality: { greater_than: 0 }

  validates :user, presence: true

  before_create :calculate_body_mass_index

  private

  def calculate_body_mass_index
    self.index    = (weight / (height**2)).round(1)
    self.category = category_for_index
  end

  def category_for_index
    case self.index
    when 0.0..15.0
      return "Very severely underweight"
    when 15.0..16.0
      return "Severely underweight"
    when 16.0..18.5
      return "Underweight"
    when 18.0..25.0
      return "Normal (healthy weight)"
    when 25.0..30.0
      return "Overweight"
    when 30.0..35.0
      return "Obese Class I (Moderately obese)"
    when 35.0..40.0
      return "Obese Class II (Severely obese)"
    when 40.0..Float::INFINITY
      return "Obese Class III (Very severely obese)"
    end
  end
end
