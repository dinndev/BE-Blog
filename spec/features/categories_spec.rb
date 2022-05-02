# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe "Categories", type: :feature do
 describe "Edit a category" do
    let(:category) { Category.create!(title: 'xyz@gmail.com', description: 'pass')}
    before { visit edit_category_path(category)}
    
    it "submits the form" do
        within 'form' do
            fill_in 'category_title', with: "#{category.title} edited"
            fill_in 'category_description', with: "sample"
            click_on 'Update Category'
           
        end
     
        expect(current_path).to eq(category_path(category))

    end
 end
#   describe "Edit a category"
#   category = Category.find(params[:id])
#   edited_category = Category.find(category.id)
end
