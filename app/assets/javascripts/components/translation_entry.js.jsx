var TranslationEntry = React.createClass({
  propTypes: {
    defaultLanguageTranslation: React.PropTypes.string,
    updateUrl: React.PropTypes.string
  },

  render: function() {
    var updateUrl = this.props.updateUrl;
    var translations = this.props.translations.map(function (translation) {
      return (
        <Translation value={translation['value']} language={translation['language_id']}
          isoCode={translation['iso_code']} updateUrl={updateUrl} translationEntryId={translation['translation_entry_id']}
          translationId={translation['id']}
        />
      );
    });
    return (
      <div className="row translation-entry">
        <div className="col-lg-4">
          <div className="panel-body no-border-radius translation-container">
            <div className="row">
              <div className="col-xs-12">
                <ol className="breadcrumb">
                  <li><a href="#">Home</a></li>
                  <li><a href="#">Library</a></li>
                  <li className="active">Data</li>
                </ol>
                <div className="preview">
                  {this.props.defaultLanguageTranslation}
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="col-lg-8">
          <div className="panel-body no-border-radius translation-container">{translations}</div>
        </div>
      </div>
    );
  }
});
