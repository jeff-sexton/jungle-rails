require 'rails_helper'

RSpec.feature 'Visitor logs in', type: :feature, js: true do
  # Setup
  before :each do
    User.create!(
      first_name: 'Francis',
      last_name: 'Bacon',
      email: 'baconTheDog@mail.com',
      password: 'thisIsAPassword',
      password_confirmation: 'thisIsAPassword'
    )
  end

  scenario 'They are redirected to the home page and their email is shown in the nav bar' do
    # ACT
    visit '/login'

    fill_in 'email', with: 'baconTheDog@mail.com'
    fill_in 'password', with: 'thisIsAPassword'

    click_on 'Sign in'

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_css 'section.products-index'

    within('nav') { expect(page).to have_content('baconTheDog@mail.com') }
  end
end
