require 'yaml'

module Gitodo
  class TodoService < Slayer::Service
    dependencies GitService

    def initialize
      @config = load_gitodo_config
    end

    def add_todo(branch:, todo:)
      config[branch] ||= []
      config[branch] << todo

      write_gitodo_config(config)
    end

    def get_todos(branch:)
      return config[branch] || []
    end

    private
    attr_accessor :config

    def gitodo_file
      return @gitodo_file if @gitodo_file
      git_root = GitService.git_repo_root
      @gitodo_file = "#{git_root}/.gitodo.yml"
    end

    def load_gitodo_config
      return {} unless File.exist? gitodo_file
      yaml = YAML.load_file(gitodo_file)
      return {} unless yaml
      return yaml
    end

    def write_gitodo_config(config)
      File.open(gitodo_file, 'w') {|f| f.write config.to_yaml }
    end
  end
end
