module PortfoliosHelper
  def portfolio_image_tag(photo, i)
    image_tag photo.image.url, :class => 'portfolio-photo' + (i + 1 == @portfolio.photos.length ? ' portfolio-photo-last' : ''), :id => "photo_#{i}", :style => (i == 0 ? '' : 'display: none;')
  end
end
