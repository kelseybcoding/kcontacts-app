class Contact < ActiveRecord::Base

  def friendly_updated_at
    updated_at.strftime('%B, %e, %Y')
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
