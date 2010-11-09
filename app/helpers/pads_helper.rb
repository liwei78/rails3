module PadsHelper
  def code_language_select_tag
    select_tag :code_language, options_for_select(SITE_SETTINGS["code_language"], "ruby"), :include_blank => true
  end
  
  def content_type_select_tag
    select_tag :content_type, options_for_select(SITE_SETTINGS["content_type"], "code collector"), :include_blank => true
  end
  
  def ej(str)
    escape_javascript( str )
  end
  
  def highlight_code(content, syntax)
    str = Uv.parse(content, "xhtml", syntax, true, "cobalt")
    str.gsub!(/(\n)/, "<br />")
    raw str
  rescue
    content_tag(:div, "code highlight error, please check your code language is right ???", :id => "error_div")
  end
  
  def warp_code(content)
    content_tag(:div, highlight_code(content.body, content.code_language), :class => "code_plain clearfix", :id => "items-#{content.id}")
  end
  
end
