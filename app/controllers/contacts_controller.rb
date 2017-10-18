class ContactsController < ApplicationController
    def create
        @contact = Contact.new(contact_params)
        @contact.save
        flash[:success] = "#{@contact.name} was added as a contact!"
        
        redirect_to company_path(@contact.company_id)
    end

    private

    def contact_params
        params.require(:contact).permit(:name, :position, :email)
    end
end
