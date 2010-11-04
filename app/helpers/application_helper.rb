module ApplicationHelper
  def seo_title
    _str = []
    _str << @page_title if @page_title
    _str << SITE_SETTINGS["site_title"]
    _str.join(' - ')
  end
end
