require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a valid email and password' do
    user = User.new(email: "test@example.com", password: "password123")
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil, password: "password123")
    expect(user).not_to be_valid
  end
end
