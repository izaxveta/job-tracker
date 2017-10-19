require 'rails_helper'

RSpec.describe Comment do 
    describe "validations" do
        context "invalid attributes" do
            it "is invalid without content" do
                comment = Comment.new()
                expect(comment).to be_invalid
            end
        end
end
