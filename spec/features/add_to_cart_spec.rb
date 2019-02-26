require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Clicking add to cart adds product to cart" do
    # ACT
    visit root_path
    within('footer.actions') do
      first('.btn').click
    end
    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content("My Cart (1)")
  end
end
