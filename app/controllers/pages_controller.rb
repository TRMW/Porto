class PagesController < ApplicationController

  def show
    case params[:page].parameterize
    when Settings.contact_title.parameterize
      render 'contact'
    when Settings.bio_title.parameterize
      render 'bio'
    when Settings.news_title.parameterize
      if params[:id]
        @post = Post.find(params[:id])
        if request.path != page_path(Settings.news_title, @post)
          redirect_to page_path(Settings.news_title, @post), status: :moved_permanently
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