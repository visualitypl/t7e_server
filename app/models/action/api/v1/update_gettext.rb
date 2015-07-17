class Action::Api::V1::UpdateGettext
  def initialize(params)
    @project  = params['project']
    @language = params['language']
    @gettext  = params['gettext']
  end

  def execute
    Action::ImportGettext.new(@project.id, @language, @gettext).save_to_db
  end
end