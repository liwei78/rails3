<% if @content.errors.any? %>
  $.jGrowl("<%= escape_javascript(@content.errors.full_messages.join(',')) %>", { header: 'Errors Detail :', sticky: true });
<% else %>
  $.jGrowl("sucess !!!", { life: 1000 });
<% end %>