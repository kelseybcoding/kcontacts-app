class ContactsController < ApplicationController

  def index
    # @contacts = Contact.all
    sort_attribute = params[:sort]
    search_term = params[:search_term]

    if sort_attribute
      @contacts = Contact.order(sort_attribute)
    else
      @contacts = Contact.all
    end

    if search_term
      @contacts = @contacts.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end
  end

  def new

  end

  def create
    contact = Contact.create(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio]
      )

    flash[:success] = "Contact Created"
    redirect_to "/contacts/#{contact.id}"
  end

  def show
    @contact = Contact.find(params[:id])
    # @contacts = @contact.contact_list
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
      phone_number: params[:phone_number],
      bio: params[:bio]
      )

    flash[:success] = "Contact Updated"
    redirect_to "/contacts/#{contact.id}"
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy

    flash[:warning] = "Contact Obliterated!!"
    redirect_to '/'
  end

end
