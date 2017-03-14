module Gitodo
  class AddTodoCommand < Slayer::Command
    def call(add_form:)
      fail! message: "The arguments passed to the add todo command were invalid!" unless add_form.is_a?(AddTodoForm)

      if GitService.is_git_repo
        branch = GitService.current_branch
        puts %Q(We're adding the todo "#{add_form.todo}" on branch `#{branch}`)
      else
        puts %Q(We're adding the todo "#{add_form.todo}")
      end

      pass! message: "We totally ignored your todo!"
    end
  end
end
