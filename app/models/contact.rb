class Contact < ActiveRecord::Base

  belongs_to :user

  # def contact_list
  #   contacts.split(', ')
  # end
  
  def friendly_updated_at
    updated_at.strftime('%B, %e, %Y')
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def user
    user.email
  end
end
