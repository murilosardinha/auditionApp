class HomeController < ApplicationController
  def index
    @auditions = {rows: [], date: ''}
    @auditions[:date] = @date
    @auditions[:rows] = @current_user.auditions.all.where(date: @date)

    @counts = [{prose: {}, count: '0', until: ''}]
    prosecutors = @current_user.prosecutors.select(:id, :name).all
    month = @date.month

    prosecutors.each_with_index do |prosecutor, index|
      count = prosecutor.
                auditions.by_date_month(@date, month).length

      @counts[index][:prose] = prosecutor.name
      @counts[index][:count] = count
      @counts[index][:until] = @date
    end

  end
end
