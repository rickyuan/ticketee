class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def new
    @title = "Create new project"
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, :notice => "Project has been created."
    else
      render :action => "new", :alert => "Project has not been created."
    end
  end
  
  def show
    @project = Project.find(params[:id])
    @title = @project.name
  end
  
end
