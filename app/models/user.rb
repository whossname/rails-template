class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def self.search(search)
        if search
            searchString = "(last_sign_in_ip LIKE :search) OR (email LIKE :search)" 
            where(searchString, search:"%#{search}%") 
        else
            all
        end
    end
end

