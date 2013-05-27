class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  scope :confirmed, where('confirmed_at is not null')
  scope :unconfirmed, where(:confirmed_at => nil)

  def state
    confirmed_at.nil? ? "INCOMPLETE" : "COMPLETE"
  end

  protected
  	# This allows us to skip the password requirement on user creation.
  	def password_required?
  		false
  	end
end
