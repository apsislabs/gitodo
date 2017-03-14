module Gitodo
  class ListTodoCommand < Slayer::Command
    def call()
      fail! message: "Not in a git repository." unless GitService.is_git_repo

      branch = GitService.current_branch

      todo_service = TodoService.new
      todos = todo_service.get_todos(branch: branch)

      pass! value: OpenStruct.new(todos: todos, branch: branch)
    end
  end
end
