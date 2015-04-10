var TranslationEntry = React.createClass({
  propTypes: {
    defaultLanguageTranslation: React.PropTypes.string
  },

  render: function() {
    var translations = this.props.translations.map(function (translation) {
      return (
        <Translation value={translation['value']} language={translation['language_id']}/>
      );
    });
    return (
      <div>
        <div>Default Language Translation: {this.props.defaultLanguageTranslation}</div>
        <div>{translations}</div>
      </div>
    );
  }
});
