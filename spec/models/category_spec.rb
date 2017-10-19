require 'rails_helper'

RSpec.describe Category do
    describe "validations" do
        context "invalid attributes" do
            it "is invalid without a title" do
                category = Category.new()
                expect(category).to be_invalid
            end
        end

        context "valid attributes" do
            it "is valid with a title" do
                category = Category.new(title: "Drama")
                expect(category).to be_valid
            end
        end
    end

    describe "relationships" do
        it "has many jobs" do
            category = Category.new(title: "Storytelling")
            expect(category).to respond_to(:jobs)
        end
    end
end