class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :tasks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  before_create :generate_api_key


  	private
  	def generate_api_key
  		self.api_key = SecureRandom.hex.slice(0..16)
  	end
end
