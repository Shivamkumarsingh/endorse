class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :transactions
  accepts_nested_attributes_for :transactions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
