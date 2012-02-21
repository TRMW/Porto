module ApplicationHelper
  def show_project_nav 
    (controller.controller_name == 'projects' && controller.action_name == 'show') || controller.controller_name == 'images'
  end
  
  def show_project_sidebar
     ((controller.controller_name == 'projects' && controller.action_name == 'show') || controller.controller_name == 'images') && @visible_projects.count > 1
  end
end
