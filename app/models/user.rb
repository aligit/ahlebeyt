class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # UserRegistration only available in development mode
  if Rails.env.production?
      devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  else
      devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  end
end
