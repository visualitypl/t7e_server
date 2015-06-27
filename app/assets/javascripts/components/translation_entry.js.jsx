var TranslationEntry = React.createClass({
  propTypes: {
    path: React.PropTypes.string,
    defaultLanguageTranslation: React.PropTypes.string,
    updateUrl: React.PropTypes.string
  },

  render: function() {
    var updateUrl = this.props.updateUrl;
    var translations = this.props.translations.map(function (translation) {
      return (
        <Translation key={translation['id']} value={translation['value']} language={translation['language_id']}
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
                  <li><a href="#">{this.props.path}</a></li>
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
