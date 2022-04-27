class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        
        if @category.save
            redirect_to categories_path
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    def update
    end

    private

    def category_params
        params.require(:category).permit(:title, :description)
    end
end
