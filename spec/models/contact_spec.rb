require 'rails_helper'

RSpec.describe Contact do
    describe "validations" do
        context "invalid attributes" do
            it "is invalid without a name" do
                contact = Contact.new(position: "Savior",
                                      email: "emma_swan@storybrooke.com")
                expect(contact).to be_invalid
            end

            it "is invalid without a position" do
                contact = Contact.new(name: "Snow White",
                                      email: "snow_white@enchatedforest.com")
                expect(contact).to be_invalid
            end

            it "is invalid without an email" do
                contact = Contact.new(name: "Regina",
                                      position: "Evil Queen")
                expect(contact).to be_invalid
            end
            
            it "is invalid without a company" do
                company = Company.new(name: "Great Big Games")
                contact = Contact.new(name: "Emma Swan",
                                      position: "Savior",
                                      email: "emma_swan@storybrooke.com")
                expect(company).to be_valid
                expect(contact).to be_invalid
            end 
        end

        context "valid attributes" do
            it "is valid with name, position, email, and associated comapny" do
                company = Company.new(name: "Once Upon A Time")
                contact = Contact.new(name: "Belle",
                                      position: "The help",
                                      email: "belle@rumplestiltskin.com",
                                      company: company)
                expect(company).to be_valid
                expect(contact).to be_valid
            end
        end
    end

    describe "relationships" do
        it "belongs to a company" do 
            contact = Contact.new(name: "Mulan",
                                  position: "Female warrior that crushes on Princess Aurora",
                                  email: "mulan@land_of_shing.com")
            expect(contact).to respond_to(:company)
        end
    end
end