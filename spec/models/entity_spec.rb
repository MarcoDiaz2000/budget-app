require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'is valid with a name and a user' do
    user = User.create(
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    entity = Entity.new(name: 'Entity1', user:)
    expect(entity).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    entity = Entity.new(name: nil, user:)
    entity.valid?
    expect(entity.errors[:name]).to include("can't be blank")
  end

  it 'belongs to a user' do
    user = User.create(
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    entity = Entity.create(name: 'Entity1', user:)
    expect(entity.user).to eq(user)
  end

  it 'can belong to many groups' do
    user = User.create(
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    group1 = Group.create(name: 'Group1', user:)
    group2 = Group.create(name: 'Group2', user:)
    entity = Entity.create(name: 'Entity1', user:)
    GroupEntity.create(group: group1, entity:)
    GroupEntity.create(group: group2, entity:)
    expect(entity.groups).to include(group1, group2)
  end
end
