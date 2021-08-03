class TaskController < ApplicationController

 before_action :this_id, only:[:show, :edit, :update, :destroy]
#  before_action :authenticate_user! , except:[:index, :show]
#  before_action :authenticate_admin!, except:[:index, :show]
 
  def index
    @tasks = Task.all.order(id: :asc).page params[:page]
  end

  def odate
    @tasks = Task.order(created_at: :desc).page params[:page]
    render :index
  end

  def edate
    @tasks = Task.order(end_date: :desc).page params[:page]
    render :index
  end

#   def indexa
#     @tasks = Task.all.page params[:page]
#   end

  def new
    @task = Task.new
  end

  def create
    # @task = current_user.Task.build(this_params)
    @task = Task.new(this_params)
    if @task.save
      redirect_to task_index_path, notice: I18n.t(:task_add_ok) 
    else
      flash.now[:error] = I18n.t(:task_add_fail) 
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(this_params)  
      redirect_to task_index_path, notice: I18n.t(:task_update_ok) 
    else
      flash.now[:error] = I18n.t(:task_update_fail) 
      render :edit
    end
  end

  def show
    
  end

  def destroy
    if @task
      @task.destroy 
      redirect_to task_index_path, notice: I18n.t(:data_deleted) 
    #   flashsuc = "#{@Task.id} 資料已刪除！"
    #   respond_js(flashsuc, @task, flasherr) #呼叫 application_controller的 respond_to
    end
  end

  # def toggled
  #     #closed = @Task.closed 
  #     if @Task.toggle(:closed).save
  #         flashsuc= "#{@Task.id} 值：#{@Task.opened}，已#{@Task.onoff} "
  #     end
  #     respond_js(flashsuc, @task, flasherr) #呼叫 application_controller的 respond_to
  # end

  # def selids
  #   meth = params[:meth]
  #   ids = params[:ids]
  #   @tasks = Task.where(id: ids)
  #   flashsuc  = selid_info(meth, ids, @tasks) 
  #   respond_js(flashsuc, @tasks, flasherr) #呼叫 application_controller的 respond_to
  # end


private

def this_params
  params.require(:task).permit(:name, :content, :aasm_state, :priority, :end_date, :page)
end

def this_id
  # 如果找不到該筆資料的話，find_by方法會回傳的值是nil而不是例外訊息。
  # find_by! 後面加驚嘆號，會回傳ActiveRecord::RecordNotFound
  @task = Task.find_by!(id: params[:id]) or not_found
end
    
end
