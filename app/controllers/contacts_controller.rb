class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new

  end

  def create
    contact = Contact.create(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:params],
      bio: params[:bio]
      )

    flash[:success] = "Contact Created"
    redirect_to "/contacts/#{contact.id}"
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])

    contact.update(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:params],
      bio: params[:bio]
      )

    flash[:success] = "Contact Updated"
    redirect_to "/contacts/#{contact.id}"
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy

    flash[:warning] = "Contact Destroyed"
    redirect_to '/'
  end
end
