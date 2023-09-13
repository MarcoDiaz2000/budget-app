require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  it 'is valid with a group and an entity' do
    user = User.create(
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    group = Group.create(name: 'Group1', user: user)
    entity = Entity.create(name: 'Entity1', user: user)
    group_entity = GroupEntity.new(group: group, entity: entity)

    expect(group_entity).to be_valid
  end

  it 'is invalid without a group' do
    user = User.create(
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    entity = Entity.create(name: 'Entity1', user: user)
    group_entity = GroupEntity.new(group: nil, entity: entity)
    group_entity.valid?

    expect(group_entity.errors[:group]).to include('must exist')
  end

  it 'is invalid without an entity' do
    user = User.create(
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    group = Group.create(name: 'Group1', user: user)
    group_entity = GroupEntity.new(group: group, entity: nil)
    group_entity.valid?

    expect(group_entity.errors[:entity]).to include('must exist')
  end
end
