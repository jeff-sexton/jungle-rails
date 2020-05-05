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

  scenario "They see the details for a product" do
    # ACT
    visit '/products/1'

    # DEBUG / VERIFY
    save_screenshot
    # puts page.html
    expect(page).to have_css 'article.product-detail'
  end

end