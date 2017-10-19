class ContactsController < ApplicationController
    def create
        @company = Company.find(params[:company_id])
        @company.contacts.new(contact_params)
        if @company.save
            flash[:success] = "#{contact_params[:name]} was added as a contact!"
            redirect_to company_path(@company)
        else
            flash[:notice] = "Please complete all boxes for your new contact."
            redirect_to company_path(@company)
        end
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :position, :email)
    end
end
