class ProjectsController < ApplicationController
  before_filter :require_login, :except => 'show'
   
  # GET /projects/1
  def show
    if Project.first
      # show front project if no ID specified, falling back to first
      @project = Project.find(params[:id] || Settings.front_project|| Project.first)
      @image = @project.images.first
      
      # used for project navigation
      @next = @project.images.length > 1 ? 2 : nil
      @previous = nil
      
      # for project sidebar nav
      @visible_projects = Project.visible
      
      # redirect historical slugs to current slugs
      if request.path != '/' && request.path != project_path(@project)
        redirect_to @project, status: :moved_permanently
      end
    else
      redirect_to admin_path
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
    6.times do
      @project.images.build
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    new = 3 - (@project.images.length % 3)
    new.times do
      @project.images.build
    end
  end

  # POST /portfolios
  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to(@project, :notice => 'Project created.')
    else
      6.times do
        @project.images.build
      end
      render :action => "new"
    end
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to(@project, :notice => 'Project updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to(admin_url)
  end
end
