class SqTypesController < ApplicationController
  before_action :set_sq_type, only: %i[show edit update destroy]

  def index
    @q = SqType.ransack(params[:q])
    @sq_types = @q.result(distinct: true).includes(:sqs).page(params[:page]).per(10)
  end

  def show
    @sq = Sq.new
  end

  def new
    @sq_type = SqType.new
  end

  def edit; end

  def create
    @sq_type = SqType.new(sq_type_params)

    if @sq_type.save
      redirect_to @sq_type, notice: "Sq type was successfully created."
    else
      render :new
    end
  end

  def update
    if @sq_type.update(sq_type_params)
      redirect_to @sq_type, notice: "Sq type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @sq_type.destroy
    redirect_to sq_types_url, notice: "Sq type was successfully destroyed."
  end

  private

  def set_sq_type
    @sq_type = SqType.find(params[:id])
  end

  def sq_type_params
    params.require(:sq_type).permit(:name, :description)
  end
end
