module BlogsHelper
  def gravatar_helper user
    # image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
    # include MD5 gem, should be part of standard ruby install
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
    
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    
    # compile URL which can be used in <img src="RIGHT_HERE"...
    image_tag "https://www.gravatar.com/avatar/#{hash}", width: 60
  end

  # Create a custom renderer that sets a custom class for block-quotes.
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end
  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
    options = {
      fenced_code_blocks: true,
      np_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,

    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
  def blog_parser blog
    @blog_url = PointOutUrl::Renderer.text_parser blog
  end

end
