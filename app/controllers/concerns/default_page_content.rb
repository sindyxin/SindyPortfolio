module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_title

  end
  
  def set_page_title
    @page_title = "Devcamp Portfolio  | My portfolio"
    @seo_keywords = "Sindy portfolio"
  end
end