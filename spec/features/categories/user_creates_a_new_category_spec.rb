require 'rails_helper'

RSpec.describe "User creates a new category" do
    scenario "a user can visit a page to create a new category" do 
        visit new_category_path

        expect(current_path).to eq("/categories/new")
        expect(page).to have_content("New Job Category")
        expect(page).to have_content("Title")
        expect(page).to have_button("Create Category")
    end
    
    scenario "a user can create a new category" do
        visit new_category_path

        fill_in "category[title]", with: "Storytelling"
        click_button "Create Category"

        expect(current_path).to eq(category_path(Category.last.id))
        expect(page).to have_content("You created #{Category.last.title}!")
        expect(page).to have_link("Edit Category", edit_category_path(Category.last.id))        
    end

    scenario "a user can't create a category that already exists" do
        category = Category.create!(title: "Storytelling")
        visit new_category_path

        fill_in "category[title]", with: "Storytelling"
        click_button "Create Category"

        expect(current_path).to eq(new_category_path)
        expect(page).to have_content("already exists!")
        expect(page).to have_content("New Job Category")
        expect(page).to have_content("Title")
        expect(page).to have_button("Create Category")
    end
end