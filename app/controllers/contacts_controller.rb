class ContactsController < ApplicationController
  
  def create
    @contact = Contact.create(contact_params)
    respond_to do |format|
      if @contact.save
        redirect_to root_path
        flash[:success] = 'Your contact is added' 
      else
        flash[:error] = @contact.errors.full_messages
        format.html {render 'homes/contact'}
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :description)
    end
end
