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
  handleChange: function(event){
    if (event.target.value.length > 1){
      this.loadTranslationsFromServer(event.target.value);
    }
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
        <input type="text" placeholder="Search" onChange={this.handleChange}/>
        {translationEntries}
      </div>
    );
  }
});
