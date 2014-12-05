class Action::Api::V1::ShowYaml
  def initialize(params)
    @project  = params['project']
    @language = params['language']
  end

  def execute
    Action::ExportYAML.new(@project.id, @language).get_yaml
  end
end