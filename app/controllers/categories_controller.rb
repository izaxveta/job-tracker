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
            render :new
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
        @category.destroy

        flash.notice = "Category #{@category.title} deleted!"

        redirect_to categories_path
    end
    
    private

    def category_params
        params.require(:category).permit(:title)
    end
end
