class BeeFamiliesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bee_families = BeeFamily.all
  end

  def show
    @bee_family = BeeFamily.find(params[:id])
  end

  def new
    @bee_family = BeeFamily.new
  end

  def create
    @bee_family = BeeFamily.new(bee_family_params)
    if @bee_family.save
      redirect_to @bee_family, notice: 'Пчелосемья создана.'
    else
      render :new
    end
  end

  def edit
    @bee_family = BeeFamily.find(params[:id])
  end

  def update
    @bee_family = BeeFamily.find(params[:id])
    if @bee_family.update(bee_family_params)
      redirect_to @bee_family, notice: 'Пчелосемья обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @bee_family = BeeFamily.find(params[:id])
    @bee_family.destroy
    redirect_to bee_families_path, notice: 'Пчелосемья удалена.'
  end

  def edit_avatar
    @bee_family = BeeFamily.find(params[:id])
  end

  def update_avatar
    @bee_family = BeeFamily.find(params[:id])
    if @bee_family.update(avatar_params)
      redirect_to @bee_family, notice: 'Аватар обновлен.'
    else
      render :edit_avatar
    end
  end

  private

  def bee_family_params
    params.require(:bee_family).permit(:name, :description, :user_id, :family_number, :queen_birth_year, :mother_family, :breed, :avatar,
      honey_productivity: [], wax_productivity: [], swarming_dates: [], nucs_count: [], winter_comments: [])
  end

  def avatar_params
    params.require(:bee_family).permit(:avatar)
  end
end
