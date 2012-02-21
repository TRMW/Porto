class PagesController < ApplicationController

  def show
    case params[:page].parameterize
    when Settings.contact_title.parameterize
      render 'contact'
    when Settings.about_title.parameterize
      render 'about'
    when Settings.blog_title.parameterize
      if params[:id]
        @post = Post.find(params[:id])
        if request.path != page_path(Settings.blog_title.downcase, @post)
          redirect_to page_path(Settings.blog_title.downcase, @post), status: :moved_permanently
        else
          render 'posts/show'
        end
      else
        @posts = Post.all
        render 'posts/index'
      end
    else
      not_found
    end
  end
  
end