require 'rails_helper'

RSpec.describe Category, type: :model do
 let!(:category) {Category.new}

 context 'Validations' do
  it "1. is not valid without title" do
    category.description = "sample desc"

    expect(category).to_not be_valid
    # expect(category.errors).to be_present
    # expect(category.errors.to_h.keys).to include(:title)   
  end

  it '2. should have a title with max length of 18' do
    category.title = "lorem ipsum do 123123"
    expect(category).to_not be_valid  
  end
  
  it 'should have a unique title' do

    Category.create(title: 'Breaking Dawn')

    category.title = "Breaking Dawn"

    expect(category).to_not be_valid  
  end

  it '4. create a valid category' do
    category.title = 'Breaking dawn'

    expect(category).to be_valid 
  end
 end
end

