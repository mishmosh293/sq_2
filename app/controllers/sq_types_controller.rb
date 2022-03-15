class SqTypesController < ApplicationController
  before_action :set_sq_type, only: %i[show edit update destroy]

  # GET /sq_types
  def index
    @q = SqType.ransack(params[:q])
    @sq_types = @q.result(distinct: true).includes(:sqs).page(params[:page]).per(10)
  end

  # GET /sq_types/1
  def show
    @sq = Sq.new
  end

  # GET /sq_types/new
  def new
    @sq_type = SqType.new
  end

  # GET /sq_types/1/edit
  def edit; end

  # POST /sq_types
  def create
    @sq_type = SqType.new(sq_type_params)

    if @sq_type.save
      redirect_to @sq_type, notice: "Sq type was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /sq_types/1
  def update
    if @sq_type.update(sq_type_params)
      redirect_to @sq_type, notice: "Sq type was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /sq_types/1
  def destroy
    @sq_type.destroy
    redirect_to sq_types_url, notice: "Sq type was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sq_type
    @sq_type = SqType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sq_type_params
    params.require(:sq_type).permit(:name, :description)
  end
end
