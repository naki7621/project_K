class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 10 }
  validate :password_number

  private
  def password_number
    unless password.match(/[a-zA-Z]/) && password.match(/\d/)
      errors.add(:password, 'は少なくとも1つの英字と1つの数字を含める必要があります')
    end
  end
end
