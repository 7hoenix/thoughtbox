var Link = React.createClass({
  getInitialState: function() {
    return { link: this.props.link }
  },
  render: function() {
    debugger
    var className = "link-" + this.state.link.id
    return (
      <div className={className}>
        {this.state.link.title}
        {this.state.link.url}
        {this.state.link.status}
      </div>
    )
  }
})
