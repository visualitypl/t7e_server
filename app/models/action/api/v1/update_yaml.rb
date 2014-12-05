class Action::Api::V1::UpdateYaml
  def initialize(params)
    @project  = params['project']
    @language = params['language']
    @yaml     = params['yaml']
  end

  def execute
    Action::ImportYaml.new(@project, @language, @yaml).save_to_db
  end

  def success?

  end
end