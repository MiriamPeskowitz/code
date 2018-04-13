
DELETE 
<!-- app/views/people/index.html.erb //-->
 
<% @people.each do |person| %>
<div class="person">
  <span><%= person.name %></span>
  <%= link_to "Delete", person, method: :delete, data: { confirm: "Really?" } %>
</div>
<% end %>


makes this html: 
<a data-confirm="Really?" rel="nofollow" data-method="delete" href="/people/1">Delete</a>
