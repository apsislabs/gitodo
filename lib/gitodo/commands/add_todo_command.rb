module Gitodo
  class AddTodoCommand < Slayer::Command
    def call(add_form:)
      fail! message: "The arguments passed to the add todo command were invalid." unless add_form.is_a?(AddTodoForm)

      fail! message: "Not in a git repository." unless GitService.is_git_repo

      branch = GitService.current_branch

      todo_service = TodoService.new

      todo_service.add_todo(branch: branch, todo: add_form.todo)
      todo_length = todo_service.get_todos(branch: branch).count

      message_singular = %Q(Todo added. There is #{todo_length} todo on branch `#{branch}`)
      message_plural = %Q(Todo added. There are #{todo_length} todos on branch `#{branch}`)
      message = todo_length == 1 ? message_singular : message_plural
      pass! message: message
    end
  end
end
