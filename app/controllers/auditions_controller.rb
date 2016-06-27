class AuditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prosecutor, only: [:new]
  before_action :set_audition, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @auditions = @current_user.auditions.all
    respond_with(@auditions)
  end

  def show
    respond_with(@audition)
  end

  def new
    @audition = Audition.new

    respond_with(@audition)
  end

  def edit
  end

  def create
    @audition = Audition.new(audition_params)
    @audition.month = Month.select(:id, :name).find_by(name: params[:audition][:month_name], year: params[:audition][:year])
    @audition.user = @current_user

    @audition.save
    respond_with(@audition)
  end

  def update
    @audition.update(audition_params)
    respond_with(@audition)
  end

  def destroy
    @audition.destroy
    respond_with(@audition)
  end

  def filter
    year = params[:year]
    month_name = params[:month_name].downcase
    @month     = @current_user.months.find_by(name: month_name, year: year)
    @auditions = @current_user.auditions.where(month: @month)
  end

  private
    def set_audition
      @audition = @current_user.auditions.find(params[:id])
    end

    def set_prosecutor
      @prosecutor = @current_user.prosecutors.all
    end

    def audition_params
      params.require(:audition).permit(:courte, :turn, :date, :prosecutor_id)
    end
end
