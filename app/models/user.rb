class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates :name, uniqueness: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user = User.where(email: email)
    if @user == []
      return false
    elsif @user.first.password != password
      return false
    else
      true
    end
  end

end
