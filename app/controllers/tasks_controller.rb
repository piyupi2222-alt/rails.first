class TasksController < ApplicationController
    def index
        @tasks= Task.all
        @total_tasks = Task.count
        @today_date = Time.now.in_time_zone("Tokyo").to_date
      end
    
      def new
        @task= Task.new
      end
    
      def create
        @task = Task.new(task_params)
        if @task.save
          flash[:notice] = "スケジュールを登録しました"
          redirect_to :tasks
        else
          flash[:notice] = "スケジュールを登録に失敗しました"
          render "new"
        end
      end
    
      def show
        @task = Task.find(params[:id])
      end
    
      def edit
        @task = Task.find(params[:id])
        
      end
    
      def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
          flash[:notice] = "スケジュールを更新しました"
          redirect_to :tasks
        else
          flash[:notice] = "スケジュールを更新に失敗しました"
          render "edit"
        end
    
      end
    
      def destroy
        @task = Task.find(params[:id])
        @task.destroy
        flash[:notice] = "スケジュールを削除しました"
        redirect_to :tasks
        
      end
      private
      def task_params  
        params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo)
      end
   
    end 
