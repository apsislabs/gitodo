module Gitodo
  class GitService < Slayer::Service

    def self.is_git_repo
      `git rev-parse --is-inside-work-tree`.strip == "true"
    end

    def self.current_branch
      branch = `git branch | grep \\* | cut -d ' ' -f2`.strip
    end
  end
end
