var Translation = React.createClass({
  propTypes: {
    value: React.PropTypes.string,
    language: React.PropTypes.string,
    isoCode: React.PropTypes.string,
    updateUrl: React.PropTypes.string
  },
  componentDidMount: function() {
    $(this.refs.editable.getDOMNode()).editable({
      type: 'textarea',
      emptytext: 'Empty',
      send: 'always',
      onblur: 'cancel'
      //url: function(params){
      //  var d = new $.Deferred;
      //}
    });
    //$.fn.editableform.buttons =
    //  '<button type="submit" class="btn btn-success editable-submit btn-mini">ACCEPT</button>' +
    //  '<button type="button" class="btn editable-cancel btn-mini">RESET</button>';
  },
  render: function() {
    var flagCountry = this.props.isoCode;
    if (flagCountry == 'en'){
      flagCountry = 'gb';
    }
    var classString = "flag " + flagCountry;
    var updateUrl = this.props.updateUrl + this.props.translationEntryId + '/translations/' + this.props.translationId;
    return (
      <div className="row marg-bot-lg translation-item">
        <div className="col-xs-2 text-left f16">
          <div className={classString}></div>
          <h4 className="font-bold text-uppercase inline">{this.props.isoCode}</h4>
        </div>
        <div className="col-xs-8">
          <div className="preview">
            <a href="#" className="translation-editable" ref="editable" data-url={updateUrl}>{this.props.value}</a>
          </div>
        </div>
        <div className="col-xs-2 text-right">
          <i className="fa fa-check text-success fa-lg marg-bot"></i>
          <br/>
          <i className="fa fa-question fa-lg marg-bot"></i>
          <br/>
          <i className="fa fa-google fa-lg marg-bot text-info"></i>
        </div>
      </div>
    );
  }
});
