class ContactsController < ApplicationController
    def create
        @company = Company.find(params[:company_id])
        @company.contacts.create!(contact_params)
        flash[:success] = "#{contact_params[:name]} was added as a contact!"
        
        redirect_to company_path(@company)
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :position, :email)
    end
end
