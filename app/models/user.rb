class User < ApplicationRecord
	attr_accessor :gauth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name,:email,:gender,:dob,:role,:org_id,:address, presence: true
  #validates :mobile, length: { is: 10 }
  validates :mobile, presence: { message: "Mobile Number Should be Given" }
  validates :mobile, length: { is:10, message:"Mobile Number Should be 10 Digits"}
  belongs_to :org
  has_many :projects
  devise :google_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :lockable, :timeoutable

end
