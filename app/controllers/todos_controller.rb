class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destroy]
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "The Todo was created succesfully"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def show
   set_todo
  end
  
  def edit
    set_todo
  end
  
  def update
   set_todo
     if @todo.update(todo_params)
       flash[:notice] = "To do was successfully updated"
       redirect_to todo_path(@todo)
     else
       render 'edit'
     end
  end
  
  def index
    @todos = Todo.all  
  end
  
  def destroy
    set_todo
    @todo.destroy
    flash[:notice] = "Todo was deleted!"
    redirect_to todos_path
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  
  def set_todo
     @todo = Todo.find(params[:id])
  end
  
end
