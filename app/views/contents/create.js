<% if @content.errors.any? %>
  $.jGrowl("error !!!", { life: 1000 });
<% else %>
  $.jGrowl("sucess !!!", { life: 1000 });
  $('#new_content_<%= @content.position %>_form').attr('action', '/contents/<%= @content.id %>');
  $('#new_content_<%= @content.position %>_form').attr('method', 'put');
<% end %> 