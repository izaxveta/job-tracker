class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "You created #{@category.title}!"
            redirect_to category_path(@category)
        else
            flash[:alert] = "#{@category.title} already exists!"
            redirect_to new_category_path
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        @category.update(category_params)    
        
        redirect_to category_path(@category)
    end

    def destroy
        @category = Category.find(params[:id])
        if @category.destroy
            flash.notice = "Category #{@category.title} deleted!"
            redirect_to categories_path
        else
            redirect_to category_path(@category)
            flash.notice = "Category is currently associated with existing jobs!"
        end
    end
    
    private

    def category_params
        params.require(:category).permit(:title)
    end
end
