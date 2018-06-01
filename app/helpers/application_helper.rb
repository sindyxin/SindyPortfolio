module ApplicationHelper

  # if we want add class for style , we can give a argument in method
  def login_helper(style)
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path, class: style) + " ".html_safe+
      (link_to 'Login', new_user_session_path, class: style)
    else 
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end
  
  def sample_helper
    content_tag(:div, "Hi, I'm in a paragraph tag ", class: "my-special-class")
  end

  def source_helper(layout_name)
    if session[:source] 
      greeting = "Thanks for visit us from #{session[:source]} and you are in #{layout_name} layout"
      content_tag(:p, greeting , class: "source-greeting")
    end
  end

  def copyright_generator
    @copyright = XinCopyright::Renderer.copyright'Xin Li', 'All rights reserved'
  end
  #how to build gem use below as example, below code if not build gem , must use code as below

  # def set_copyright 

  #   @copyright = DevcampViewTool::Renderer.copyright'Xin Li', 'All rights reserved'
  # end

  # module DevcampViewTool
  #   class Renderer
  #     def self.copyright name, msg
  #       "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe  #must double quotes
  #     end
  #   end
  # end


end
