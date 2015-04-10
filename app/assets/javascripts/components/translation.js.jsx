var Translation = React.createClass({
  propTypes: {
    value: React.PropTypes.string,
    language: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Value: {this.props.value}</div>
        <div>Language: {this.props.language}</div>
      </div>
    );
  }
});
