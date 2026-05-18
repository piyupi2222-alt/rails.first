class SchedulesController < ApplicationController
    def index
      @schedules = Schedule.all
    end
   
    def create
      @schedule = Schedule.new(params.require(:schedule).permit(:title, :startday, :finishday, :allday, :updateday, :schedule_memo))
      if @schedule.save
        flash[:notice] = "予定を追加しました"
        redirect_to :schedules
      else
        render "new"
      end
    end

    def show
      @schedule = get_params
    end
  
    def new
      @schedule = Schedule.new
    end
  
    def edit
      @schedule = get_params
    end
  
    def update
      @schedule = get_params
      if @schedule.update(params.require(:schedule).permit(:title, :startday, :finishday, :allday, :updateday, :schedule_memo))
        flash[:notice] = "スケジュールを更新しました"
        redirect_to :schedules
      else
        render "edit"
      end
    end

    def destroy
      @schedule = get_params
      @schedule.destroy
      flash[:notice] = "予定を削除しました"
      redirect_to :schedules
    end

    private
      def get_params
        Schedule.find(params[:id])
      end
  end
  
