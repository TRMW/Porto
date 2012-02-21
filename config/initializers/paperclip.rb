Paperclip.interpolates :project_id do |attachment, style|
  attachment.instance.project.id
end