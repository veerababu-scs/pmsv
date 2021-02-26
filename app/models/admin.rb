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
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
