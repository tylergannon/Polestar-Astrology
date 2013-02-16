class Member < ActiveRecord::Base
  # Include default devise modules. Others available are::confirmable, 
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable, :registerable,
  devise :database_authenticatable, :encryptable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :people
  
  def self.by_email(em)
    where(email: em).first
  end

end
