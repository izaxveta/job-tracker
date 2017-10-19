require 'rails_helper'

RSpec.describe Comment do 
    describe "validations" do
        context "invalid attributes" do
            it "is invalid without content" do
                comment = Comment.new()
                expect(comment).to be_invalid
            end

            it "is invalid with without job id" do
                company = Company.new(name: "Great Big Games")                
                job = Job.new(title: "Illustrator",
                              level_of_interest: 47, 
                              description: "Paint pretty pictures",
                              city: "San Francisco",
                              company: company)
                comment = Comment.new(content: "Ta-da!")
                expect(company).to be_valid
                expect(job).to be_valid
                expect(comment).to be_invalid
            end
        end
        
        context "valid attributes" do    
            it "is valid with job id and content" do
                company = Company.new(name: "Great Big Games")                
                job = Job.new(title: "Illustrator",
                              level_of_interest: 47, 
                              description: "Paint pretty pictures",
                              city: "San Francisco",
                              company: company)
                comment = Comment.new(content: "Ta-da!", job: job)
                expect(company).to be_valid
                expect(job).to be_valid
                expect(comment).to be_valid
            end
        end
    end

    describe "relations" do
        it "belongs to a job" do
            comment = Comment.new(content: "Ta-da!")
            expect(comment).to respond_to(:job)
        end
    end
end
