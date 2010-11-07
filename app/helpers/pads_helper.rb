module PadsHelper
  def code_language_select_tag
    select_tag :code_language, options_for_select(SITE_SETTINGS["code_language"], "rails"), :include_blank => true
  end
  
  def content_type_select_tag
    select_tag :content_type, options_for_select(SITE_SETTINGS["content_type"], "code collector"), :include_blank => true
  end
end
