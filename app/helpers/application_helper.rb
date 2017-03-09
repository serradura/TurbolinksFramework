module ApplicationHelper

  def page_js_class
    actn = case action_name
           when "create" then "new"
           when "update" then "edit"
           else
             action_name
           end
    cntr = controller_name
    [controller_name, action_name].map(&:camelize).join
  end

end
