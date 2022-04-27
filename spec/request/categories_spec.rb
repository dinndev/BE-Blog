require 'rails_helper'


RSpec.describe "CategoriesController", type: :request  do
    describe "GET /categories/new" do
        it 'returns the new page' do
          get '/categories/new'

          expect(response).to have_http_status(200)  
        end
      end

     describe "POST /categories/" do
        it 'creates categories' do
          post "/categories", params: {category: {title: "new caregory", description: "lol"}}

          expect(response).to have_http_status(302)  
        end
      end

        describe "POST /categories/1/edit" do
            it 'returns the edit page' do
              category = Category.create!(title: "test", description: "test")
              get "/categories/#{category.id}/edit"
    
              expect(response).to have_http_status(200)  
            end

    end

    describe "GET /categories/1/" do
        it 'returns the edit page' do
          category = Category.create!(title: "test", description: "test")
          get "/categories/#{category.id}/edit"

          expect(response).to have_http_status(200)  
        end
      end

        # update
    describe "PATCH /categories/1/" do
      it 'updates the category ' do
        category = Category.create!(title: "test", title: "test")
        patch "/categories/#{category.id}", params: {category: {title: "new caregory", description: "lol"}}
        edited_category = Category.find(category.id)
        expect(category.title).not_to eq(edited_category) 
      end
    end

      # Show
      describe "GET /categories/1" do
        it 'returns the category' do
          category = Category.create!(title: "test", description: "test")
          get "/categories/#{category.id}"
          expect(response).to have_http_status(200)  
        end
    
end
    
    
end