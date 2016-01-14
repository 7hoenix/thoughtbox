var linkTemplate = _.template(
  '<div class="link">' +
    '<h2 class="link-title"><%= title %></h2>' +
    '<p class="link-url"><%= url %></p>' +
    '<p class="link-status"><%= status %>' +
    '<div class="link-statuses link-buttons">' +
    '</div>' +
    '</div>'
);
