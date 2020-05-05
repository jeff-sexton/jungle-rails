require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  # Setup
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the details for a product after navigating from the home page" do
    # ACT
    visit root_path

    # click_on ""
    page.first('article.product > header > a').click

    # DEBUG / VERIFY
    save_screenshot
    # puts page.html
    expect(page).to have_css 'article.product-detail'
  end

end