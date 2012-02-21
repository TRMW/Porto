class ImagesController < ApplicationController
  before_filter :require_login, :except => 'show'
  
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

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  def create
    @image = Image.new(params[:image])

    if @image.save
      redirect_to(@image, :notice => 'Image was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /images/1
  def update
    @image = Image.find(params[:id])

    if @image.update_attributes(params[:image])
      redirect_to(@image, :notice => 'Image was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /images/1
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    
    redirect_to(images_url)
  end
end