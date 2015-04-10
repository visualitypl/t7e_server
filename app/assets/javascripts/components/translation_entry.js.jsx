var TranslationEntry = React.createClass({
  propTypes: {
    defaultLanguageTranslation: React.PropTypes.string,
    updateUrl: React.PropTypes.string
  },

  render: function() {
    var translations = this.props.translations.map(function (translation) {
      return (
        <Translation value={translation['value']} language={translation['language_id']}
          isoCode={translation['iso_code']} updateUrl='http://localhost:3000/projects/1/translation_entries/' translationEntryId={translation['translation_entry_id']}
          translationId={translation['id']}
        />
      );
    });
    return (
      <div className="panel">
        <div className="row">
          <div className="col-lg-3">{this.props.defaultLanguageTranslation}</div>
          <div className="col-lg-9">{translations}</div>
        </div>
      </div>
    );
  }
});
