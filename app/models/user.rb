class User < ActiveRecord::Base
  has_secure_password

  belongs_to :store
  has_many :orders

  has_many :user_roles
  has_many :roles, through: :user_roles

  def registered?
  	roles.exists?(name: 'registered')
  end

  def store_admin?
  	roles.exists?(name: 'store_admin')
  end

  def admin?
  	roles.exists?(name: 'admin')
  end
end
