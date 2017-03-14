module Gitodo
  class AddTodoCommand < Slayer::Command
    def call(add_form:)
      fail! message: "The arguments passed to the add todo command were invalid." unless add_form.is_a?(AddTodoForm)

      fail! message: "Not in a git repository." unless GitService.is_git_repo

      branch = GitService.current_branch

      todo_service = TodoService.new

      todo_service.add_todo(branch: branch, todo: add_form.todo)
      todo_count = todo_service.get_todos(branch: branch).count

      pass! value: OpenStruct.new( todo_count: todo_count, branch: branch)
    end
  end
end
