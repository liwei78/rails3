<% if @pad.errors.any? %>
  $.jGrowl("<%= ej(@msg) %>", { header: 'Error :', sticky: true });
<% else %>
  top.location = "/pads/<%= @pad.id %>";
<% end %>