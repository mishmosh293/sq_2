class SqsController < ApplicationController
  before_action :set_sq, only: %i[show edit update destroy]

  def index
    @q = Sq.ransack(params[:q])
    @sqs = @q.result(distinct: true).includes(:sqtype).page(params[:page]).per(10)
  end

  def show; end

  def new
    @sq = Sq.new
  end

  def edit; end

  def create
    @sq = Sq.new(sq_params)

    if @sq.save
      message = "Sq was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @sq, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @sq.update(sq_params)
      redirect_to @sq, notice: "Sq was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @sq.destroy
    message = "Sq was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to sqs_url, notice: message
    end
  end

  private

  def set_sq
    @sq = Sq.find(params[:id])
  end

  def sq_params
    params.require(:sq).permit(:sqtype_id, :name, :pic, :description)
  end
end
