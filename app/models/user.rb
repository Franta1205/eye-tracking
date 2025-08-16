class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :analyses
  
  attr_accessor :first_name, :last_name
  
  after_create :create_profile

  enum user_type: {
    classic: 0,
    premium: 1,
    enterprise: 2,
    admin: 3,
  }
  
  private
  
  def create_profile
    self.build_profile(first_name: first_name, last_name: last_name).save
  end
end
