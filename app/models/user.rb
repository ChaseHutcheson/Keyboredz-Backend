class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
    # Add any other validations you require for username
    
    validates :email, presence: true, uniqueness: true
    # Add any other validations you require for email
  
    has_secure_password
  end
  