require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with a name' do
    category = Category.new(
      name: 'Makanan'
    )

    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = Category.new(
      name: nil
    )

    category.valid?

    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with duplicate name' do
    category1 = Category.create(
      name: "Makanan"
    )

    category2 = Category.new(
      name: "Makanan"
    )

    category2.valid?

    expect(category2.errors[:name]).to include("has already been taken")
  end
end
