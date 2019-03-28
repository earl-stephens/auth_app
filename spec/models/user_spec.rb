require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :email }
    it {should validate_presence_of :password }
    it {should validate_uniqueness_of :name }
    it {should validate_uniqueness_of :email }
  end

  # describe 'class methods' do
  #   user1 = User.create(name: "Bob", email: "email1", password: "password1")
  #   user2 = User.create(name: "Bill", email: "email2", password: "password2")
  #
  #
  # end

end
