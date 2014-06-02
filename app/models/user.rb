class User < ActiveRecord::Base
  extend Enumerize
  enumerize :role, in: [:admin, :user]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :province

  validates :province, :role, :presence => true

  def self.query(query)
    where("email LIKE ?", "%#{query}%")
  end

end
