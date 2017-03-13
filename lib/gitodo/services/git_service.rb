module Gitodo
  class GitService

    def self.current_branch
      `git branch | grep \\* | cut -d ' ' -f2`.strip
    end
  end
end
