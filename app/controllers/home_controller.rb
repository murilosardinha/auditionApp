class HomeController < ApplicationController
  def index
    @auditions = {rows: [], date: ''}
    date  = Date.today
    @auditions[:date] = date
    @auditions[:rows] = Audition.all.where(date: date)

    year = date.strftime("%Y")
    @months = Month.select(:id, :name, :year).where(year: year)

    @counts = [{prose: {}, count: '0', until: ''}]
    prosecutors = Prosecutor.select(:id, :name).all
    month = date.month

    prosecutors.each_with_index do |prosecutor, index|
      count = prosecutor.
                auditions.by_date_month(date, month).length

      @counts[index][:prose] = prosecutor.name
      @counts[index][:count] = count
      @counts[index][:until] = date
    end

  end
end
