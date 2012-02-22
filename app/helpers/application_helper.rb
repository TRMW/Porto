module ApplicationHelper
  def show_top_nav
    !current_page?(admin_setup_path) && (!current_page?(new_admin_project_path) && Project.count > 0)
  end
  
  def show_project_nav 
    (controller.controller_name == 'projects' && controller.action_name == 'show') || controller.controller_name == 'images'
  end
  
  def show_project_sidebar
     ((controller.controller_name == 'projects' && controller.action_name == 'show') || controller.controller_name == 'images') && @visible_projects.count > 1
  end
end
