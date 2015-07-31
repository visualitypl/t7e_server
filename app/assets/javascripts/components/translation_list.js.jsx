var TranslationList = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  loadTranslationsFromServer: function(searchKeyword) {
    $.ajax({
      url: this.props.url,
      data: { search_keyword: searchKeyword },
      dataType: 'json',
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  componentWillMount: function(){
    this.loadTranslationsFromServer = _.debounce(this.loadTranslationsFromServer,300);
  },
  handleChange: function(event){
    if (event.target.value.length > 1){
      this.loadTranslationsFromServer(event.target.value);
    }
    return;
  },
  render: function() {
    var updateUrl = this.props.updateUrl;
    var translationEntries = this.state.data.map(function (translationEntry) {
      return (
        <TranslationEntry key={translationEntry['id']} path={translationEntry['path']} defaultLanguageTranslation={translationEntry['defaultLanguageTranslation']} defaultIsoCode={translationEntry['defaultIsoCode']} translations={translationEntry['translations']} updateUrl={updateUrl}/>
      );
    });

    return (

      <div className="row marg-top-xl">
        <div className="col-lg-10 col-lg-offset-1">
           <div className="translation-panel">
            <div className="main-search marg-bot">
              <div className="input-group">
                <input className="form-control" placeholder="Search" type="text" onChange={this.handleChange}/>
                <span className="input-group-addon">
                  <i className="fa fa-search"></i>
                </span>
              </div>
            </div>
            <div className="translation-list">
              <div className="panel panel-default">
                <div className="panel-body">{translationEntries}</div>
              </div>
            </div>
          </div>
        </div>
      </div>

    );
  }
});
