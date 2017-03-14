require 'yaml'

module Gitodo
  class Todos
    def initialize

      todo_file = gitodo_file

      if File.exist? todo_file
        @config = YAML.load_file("#{git_root}/.gitodo.yml")
      else
        @config = {}
      end
    end

    def add_todo(branch, todo)
      @config[branch.to_sym] ||= []
      @config[branch.to_sym] << todo
    end

    private
    def gitodo_file
      git_root = GitService.git_repo_root
      "#{git_root}/.gitodo.yml"
    end

  end
end
