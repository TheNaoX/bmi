require "rails_helper"

feature "User calculate body mass index", :js, :chrome do
  let(:user) { create :user }

  background { login_as user, scope: :user }

  scenario "Adding a new weight and height" do
    visit root_path

    within "#new_body_mass_index" do
      fill_in "Your height (meters)", with: 1.77
      fill_in "Your weight (Kilograms)", with: 89
      click_on "Calculate"
    end

    expect(page).to have_content("Your body mass index is 28.4 you are Overweight")
  end
end
