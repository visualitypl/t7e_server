var TranslationList = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  loadTranslationsFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  handleSearch: function(){
    this.loadTranslationsFromServer();
    return;
  },
  render: function() {
    var translationEntries = this.state.data.map(function (translationEntry) {
      return (
        <TranslationEntry defaultLanguageTranslation={translationEntry['defaultLanguageTranslation']} translations={translationEntry['translations']}/>
      );
    });

    return (
      <div>
        {translationEntries}
        <button onClick={this.handleSearch}>Search</button>
      </div>
    );
  }
});
