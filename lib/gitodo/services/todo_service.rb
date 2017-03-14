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

      write_gitodo_config
    end

    def get_todos(branch:, todo_indexes: nil)
      raw_todos = config[branch] || []
      todos = raw_todos.map.with_index {|todo, i| Todo.new(display_index: i+1, internal_index: i, todo: todo) }

      todos = todos.reject{|t| !todo_indexes.include?(t.display_index) } if todo_indexes

      todos
    end

    def complete_todos(branch:, todo_indexes:)
      todos = get_todos(branch: branch)
      todo_indexes = todo_indexes.uniq

      to_complete = todos.reject{|t| !todo_indexes.include?(t.display_index) }

      to_complete.each do |todo|
        # index-1 to map from crazy user land indexes to real, sane indexes
        config[branch][todo.internal_index] = nil
      end

      config[branch] = config[branch].reject(&:nil?)
      write_gitodo_config
    end

    def validate_todo_indexes(branch:, todo_indexes:)
      valid_todo_indexes = get_todos(branch: branch).map{|t| t.display_index}

      todo_indexes = todo_indexes.uniq
      todo_indexes = todo_indexes.each do |index|
        return false unless valid_todo_indexes.include? index
      end

      return true
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

    def write_gitodo_config
      File.open(gitodo_file, 'w') {|f| f.write config.to_yaml }
    end
  end
end
