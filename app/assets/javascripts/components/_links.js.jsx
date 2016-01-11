var Links = React.createClass({
  getInitialState: function() {
    return { links: this.props.links || []}
  },
  handleUpdate: function(event) {
    var linkId = event.target.value

    var links = this.state.links
    var newLink = links.filter(function(link) {
      return link.id === linkId
    })

    var oldLinks = this.state.links.filter(function(link) {
      return link.id !== linkId
    })

    $.ajax({
      url: "/change_status",
      type: "GET",
      data: { link_id: linkId },
      success: function(response) {
        var newLinks = oldLinks + newLink
        this.setState({links: newLinks})
      }.bind(this)
    });
  },
  render: function() {
    var links = this.state.links.map(function(link, index) {
      var statusText = link.status ? "Mark as unread" : "Mark as read"
      var statusClass = link.status ? "grey" : "normal"
      return (
        <div className={"link " + statusClass}key={"link-" + index}>
          {link.title}
          {link.url}
          {link.status}
          <button className="btn"
                  onClick={this.handleUpdate}
                  value={link.id}
                  >
            {statusText}
          </button>
        </div>
      )
    }.bind(this));

    return (
      <div className="links-index">
        {links}
      </div>
    )
  }
})
