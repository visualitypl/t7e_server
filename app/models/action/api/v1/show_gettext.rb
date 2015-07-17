class Action::Api::V1::ShowGettext
  def initialize(params)
    @project  = params['project']
    @language = params['language']
  end

  def execute
    Action::ExportGettext.new(@project.id, @language).get_gettext
  end
end