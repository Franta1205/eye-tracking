class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  
  attr_accessor :first_name, :last_name
  
  after_create :create_profile
  
  private
  
  def create_profile
    self.build_profile(first_name: first_name, last_name: last_name).save
  end
end
