module ApplicationHelper
  def seo_title
    _str = []
    _str << @page_title if @page_title
    _str << SITE_SETTINGS["site_title"]
    _str.join(' - ')
  end
  
  def logined?
    !session[:user_id].nil?
  end
  
  def js_void
    "javascript:void(0);"
  end
  
  def nbsp(n=4)
    raw "&nbsp;"*n
  end
  
end
