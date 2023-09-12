class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def new
    @entity = Entity.new
    @groups = current_user.groups
  end

  def create
    @entity = @group.entities.new(entity_params.merge(user_id: current_user.id))
    if @entity.save
      redirect_to group_path(@group), notice: 'Transacción creada exitosamente.'
    else
      render 'new'
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
