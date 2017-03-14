module Gitodo
  class DoneTodoCommand < Slayer::Command
    def call(done_form:)
      fail! message: "The arguments passed to the add todo command were invalid." unless done_form.is_a?(DoneTodoForm)
      fail! message: "Not in a git repository." unless GitService.is_git_repo

      branch = GitService.current_branch

      todo_service = TodoService.new
      todos = todo_service.get_todos(branch: branch)

      unless todos.any?
        fail! message: %Q(There were no todos to finish.)
      end

      todo_indexes = done_form.todo_indexes.uniq

      validated = todo_service.validate_todo_indexes(branch: branch, todo_indexes: todo_indexes)
      fail! message: "One of the todo indexes was not valid." unless validated

      todo_service.complete_todos(branch: branch, todo_indexes: todo_indexes)
      todo_count = todo_service.get_todos(branch: branch).count

      pass! value: OpenStruct.new(completed_count: todo_indexes.count, todo_count: todo_count, branch: branch)
    end
  end
end
