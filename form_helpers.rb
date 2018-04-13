form_for 

<!-- app/views/posts/edit.html.erb //-->
 
<%= form_for @post do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :content %>
  <%= f.submit %>
<% end %>

creates this: 

<form class="edit_post" id="edit_post" action="/posts/1" accept-charset="UTF-8" method="post">
  <input name="utf8" type="hidden" value="&#x2713;" />
  <input type="hidden" name="_method" value="patch" />
  <input type="hidden" name="authenticity_token" value="nRPP2OqVKB00/Cr+8EvHfYrb5sAkZRtr8f6dzBaJAI+cMceR0fUatcLWd4zdwYCpojW2J3QLK6uyBKeFAgZvmw==" />
  <input type="text" name="post[title]" id="post_title" value="Existing Post Title"/>
  <textarea name="post[content]" id="post_content">Existing Post Content</textarea>
  <input type="submit" name="commit" value="Update Post" />
</form>