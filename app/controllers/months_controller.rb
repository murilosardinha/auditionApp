class MonthsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_month, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @months = Month.all
    respond_with(@months)
  end

  def show
    respond_with(@month)
  end

  def new
    @month = Month.new
    respond_with(@month)
  end

  def edit
  end

  def create
    @month = Month.new(month_params)
    @month.save
    respond_with(@month)
  end

  def update
    @month.update(month_params)
    respond_with(@month)
  end

  def destroy
    @month.destroy
    respond_with(@month)
  end

  private
    def set_month
      @month = Month.find(params[:id])
    end

    def month_params
      params.require(:month).permit(:name, :year)
    end
end
