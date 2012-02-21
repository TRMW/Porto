module ProjectsHelper
  def project_image_tag(image, i)
    image_tag image.file.url, :class => 'project-image', :style => (image.position == @image.position ? '' : 'display: none;')
  end
  
  def current_or_front(project)
    if @image
      project == @image.project
    else
      current_page?(project) || (current_page?(root_path) && project.is_front_project)
    end
  end
end
