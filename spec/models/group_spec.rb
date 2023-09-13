require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with a name and a user' do
    user = User.create(
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    group = Group.new(name: 'Group1', user:)
    expect(group).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    group = Group.new(name: nil, user:)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'belongs to a user' do
    user = User.create(
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    group = Group.create(name: 'Group1', user:)
    expect(group.user).to eq(user)
  end

  it 'can have many entities' do
    user = User.create(
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    group = Group.create(name: 'Group1', user:)
    entity1 = Entity.create(name: 'Entity1', user:)
    entity2 = Entity.create(name: 'Entity2', user:)
    GroupEntity.create(group:, entity: entity1)
    GroupEntity.create(group:, entity: entity2)
    expect(group.entities).to include(entity1, entity2)
  end
end
