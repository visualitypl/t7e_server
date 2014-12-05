class Action::Api::V1::ShowYaml
  def initialize(params)
    @project  = params['project']
    @language = params['language']
    @yaml     = params['yaml']
  end

  def execute
    Action::GetYAML.new(@project.id, @language, @yaml).save_to_db
  end
end