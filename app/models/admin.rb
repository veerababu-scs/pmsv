class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #validates :name, presence: true
  #belongs_to :player

  #rails_admin do
   # configure :player do
    #  label 'Owner of this ball: '
    #end
  #end
  enum role: {
    :Admin=>"Admin",
    :Super_Admin=>"Super Admin",
    :Sub_Admin=>"Sub Admin"
  }
  #validates :name,:role, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
