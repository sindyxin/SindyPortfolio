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
  
  # def sample_helper
  #   content_tag(:div, "Hi, I'm in a paragraph tag ", class: "my-special-class")
  # end

  def source_helper(layout_name)
    if session[:source] 
      greeting = "Thanks for visit us from #{session[:source]} and you are in #{layout_name} layout"
      content_tag(:p, greeting , class: "source-greeting")
    end
  end

  def copyright_generator
    @copyright = XinCopyright::Renderer.copyright'Xin Li', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_me_path,
        title: "About Me"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: portfolios_path,
        title: "Projects"
      },
      {
        url: blogs_path,
        title: "Blogs"
      },
      {
        url: tech_news_path,
        title: "Tech News"
      }

    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end


 #before refactor
# def nav_helper style, tag_type
# nav_links = <<NAV    
# <#{tag_type}><a href="#{root_path}" class="#{style} #{active? root_path}">Home</a></#{tag_type}>
# <#{tag_type}><a href="#{about_me_path}" class="#{style} #{active? about_me_path}">About Me</a></#{tag_type}>
# <#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
# <#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Projects</a></#{tag_type}>
# <#{tag_type}><a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blogs</a></#{tag_type}>
# NAV
#     nav_links.html_safe
#   end

  def active? path 
    #current_page? is special method in rails
    "active" if current_page? path 
    #need add #{active? root_path} kind of this code in class=""
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
  def alert
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end
  def alert_generator msg
    js add_gritter(msg, title: "Xin Li Portfolio", sticky: false)
  end

end
