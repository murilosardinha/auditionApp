class AuditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prosecutor, only: [:new]
  before_action :set_audition, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @auditions = Audition.all
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
    @month     = Month.find_by(name: month_name, year: year)
    @auditions = Audition.all.where(month: @month)
  end

  private
    def set_audition
      @audition = Audition.find(params[:id])
    end

    def set_prosecutor
      @prosecutor = Prosecutor.all
    end

    def audition_params
      params.require(:audition).permit(:courte, :turn, :date, :prosecutor_id)
    end
end
