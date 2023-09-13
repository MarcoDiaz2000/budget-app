require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, and password' do
    user = User.new(
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(
      name: nil,
      email: 'john.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'can have many entities' do
    user = User.create(
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    entity1 = Entity.create(name: 'Entity1', user_id: user.id)
    entity2 = Entity.create(name: 'Entity2', user_id: user.id)
    expect(user.entities).to include(entity1, entity2)
  end

  it 'can have many groups' do
    user = User.create(
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    group1 = Group.create(name: 'Group1', user_id: user.id)
    group2 = Group.create(name: 'Group2', user_id: user.id)
    expect(user.groups).to include(group1, group2)
  end
end
