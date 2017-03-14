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

      todo_indexes = done_form.todo_indexes.map do |index|
        begin
          todo_index = Integer(index, 10)

          if todo_index < 1 || todo_index > todos.count
            fail! message: %Q(The todo index "#{index}" was not in the range 1-#{todos.count}.)
          end

          # Shift from userindex [1..todos.count] to
          # sane-programmer land [0..todos.count-1]
          todo_index - 1
        rescue
          fail! message: %Q(The todo index "#{index}" was not a valid integer.)
        end
      end

      todo_indexes = todo_indexes.uniq
      todo_service.complete_todos(branch: branch, todo_indexes: todo_indexes)

      todo_count = todo_service.get_todos(branch: branch).count

      pass! value: OpenStruct.new(completed_count: todo_indexes.count, todo_count: todo_count, branch: branch)
    end
  end
end
