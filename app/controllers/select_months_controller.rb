class SelectMonthsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_select_value, only: %i[show edit update destroy]

  def set_select_value
    @selectdate = SelectMonth.find(params[:id])
  end
  
  def index
    @selectdates = SelectMonth.all.where(doctor_id:current_user.doctor.id)
  end

  def new
    @selectdate = SelectMonth.new
  end

  def sames
    starting_year = params['starting_date(1i)']
    starting_month = params['starting_date(2i)']
    starting_date = params['starting_date(3i)']
    ending_year = params['ending_date(1i)']
    ending_month = params['ending_date(2i)']
    ending_date = params['ending_date(3i)']
    starting_time_h = params['starting_time(4i)']
    starting_time_m = params['starting_time(5i)']
    ending_time_h = params['ending_time(4i)']
    ending_time_m = params['ending_time(5i)']
    @start_date = starting_year + '-' + starting_month + '-'+ starting_date
    @end_date = ending_year + '-' + ending_month + '-' + ending_date
    @start_time = starting_time_h + ':' +starting_time_m
    @end_time = ending_time_h + ':' + ending_time_m
  end

  def create
    sames
    if(@start_date <= @end_date)
    SelectMonth.create(starting_date:@start_date,ending_date:@end_date,starting_time:@start_time.to_time,ending_time:@end_time.to_time, doctor_id:current_user.doctor.id)    
    else  
      flash[:notice] = 'Enter Proper Details'
      render :new
    end
    redirect_to select_months_path
  end

  def edit
  end

  def update
    starting_year = params[:select_month]['starting_date(1i)']
    starting_month = params[:select_month]['starting_date(2i)']
    starting_date = params[:select_month]['starting_date(3i)']
    ending_year = params[:select_month]['ending_date(1i)']
    ending_month = params[:select_month]['ending_date(2i)']
    ending_date = params[:select_month]['ending_date(3i)']
    @start_date = starting_year + '-' + starting_month + '-' + starting_date
    @end_date = ending_year + '-' + ending_month + '-' + ending_date
    if(@start_date <= @end_date)
    @selectdate.update(starting_date:@start_date,ending_date:@end_date,doctor_id:current_user.doctor.id)    
    else  
      flash[:notice] = 'Enter Proper Details'
      render :edit
    end
    redirect_to select_months_path
  end

  def destroy
    redirect_to select_months_path if @selectdate.destroy
  end

end
