class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :org
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :lockable, :timeoutable
end
