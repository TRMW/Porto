class ImagesController < ApplicationController 
  # GET /images/1
  def show
  	@project = Project.find(params[:project_id])
    @image = @project.images.find_by_position(params[:id])
    
    # used for project navigation
    @next = @image.position != @project.images.length ? @image.position + 1 : nil
    @previous = @image.position != 1 ? @image.position - 1 : nil
    
    # for project sidebar nav
    @visible_projects = Project.visible # for nav
    
    render 'projects/show'
  end
end