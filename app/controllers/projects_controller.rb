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
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice => "Project has benn updated."
    else
      render :action => "edit", :alert => "Project has not been updated."
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, :notice => "Project has been deleted."
  end
  
  
end
