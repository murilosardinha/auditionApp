class ProsecutorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prosecutor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @prosecutors = @current_user.prosecutors.all
    respond_with(@prosecutors)
  end

  def show
    respond_with(@prosecutor)
  end

  def new
    @prosecutor = Prosecutor.new
    respond_with(@prosecutor)
  end

  def edit
  end

  def create
    @prosecutor = Prosecutor.new(prosecutor_params)
    @prosecutor.user = @current_user

    @prosecutor.save
    respond_with(@prosecutor)
  end

  def update
    @prosecutor.update(prosecutor_params)
    respond_with(@prosecutor)
  end

  def destroy
    @prosecutor.destroy
    respond_with(@prosecutor)
  end

  private
    def set_prosecutor
      @prosecutor = @current_user.prosecutors.find(params[:id])
    end

    def prosecutor_params
      params.require(:prosecutor).permit(:name)
    end
end
