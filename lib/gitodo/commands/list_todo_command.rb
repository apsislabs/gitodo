module Gitodo
  class ListTodoCommand < Slayer::Command
    def call(list_form: nil)
      fail! message: "Not in a git repository." unless GitService.is_git_repo

      branch = GitService.current_branch
      todo_service = TodoService.new

      matching = list_form ? list_form.todo_indexes : nil

      if matching
        validated = todo_service.validate_todo_indexes(branch: branch, todo_indexes: matching)
        fail! message: "One of the todo indexes was not valid." unless validated
      end

      todos = todo_service.get_todos(branch: branch, todo_indexes: matching)

      pass! value: OpenStruct.new(todos: todos, branch: branch)
    end
  end
end
