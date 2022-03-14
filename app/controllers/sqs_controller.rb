class SqsController < ApplicationController
  before_action :set_sq, only: [:show, :edit, :update, :destroy]

  # GET /sqs
  def index
    @sqs = Sq.all
  end

  # GET /sqs/1
  def show
  end

  # GET /sqs/new
  def new
    @sq = Sq.new
  end

  # GET /sqs/1/edit
  def edit
  end

  # POST /sqs
  def create
    @sq = Sq.new(sq_params)

    if @sq.save
      redirect_to @sq, notice: 'Sq was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sqs/1
  def update
    if @sq.update(sq_params)
      redirect_to @sq, notice: 'Sq was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sqs/1
  def destroy
    @sq.destroy
    redirect_to sqs_url, notice: 'Sq was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sq
      @sq = Sq.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sq_params
      params.require(:sq).permit(:sqtype_id, :name, :pic, :description)
    end
end
