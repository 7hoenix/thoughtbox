$(document).ready(function () {
  loadLinkForm();
  loadLinks();
});

function loadLinkForm() {
  $('#new-link-form').html('<form>' +
    '<input placeholder="Title" class="link-attribute">' +
    '<input placeholder="Url" class="link-attribute">' +
    '<select class="link-attribute link-status">' +
      '<option value="false">false</option>' +
      '<option value="true">true</option>' +
    '</select>' +
    '<button class="new-link-button">Create link</button>' +
  '</form>')
}

function loadLinks() {
  $('#link-index').html();
}

function handleStatusChange(id) {
  $.ajax({
    type: 'UPDATE',
    url: '/change_status',
    data: { link_id: id }
  })
  .done(function (data) {
    updateStatus(data);
  });
}

function updateStatus (link) {
}
