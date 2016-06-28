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
    redirect_to filter_audition_path(year: @year, month_name: ( l @date, format: :month ))
  end

  def filter
    year = params[:year]
    month_name = params[:month_name].downcase
    @month     = @current_user.months.find_by(name: month_name, year: year)

    t('date.month_names').length.times do |index|
      if (t('date.month_names')[index] == @month.name.capitalize) && !(t('date.month_names')[index].nil?)
        @month_num = index
      end
    end

    @auditions = @current_user.auditions.by_month(@month_num)
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
