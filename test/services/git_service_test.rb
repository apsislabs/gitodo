require 'test_helper'

class Gitodo::GitServiceTest < Minitest::Test
  def test_should_get_current_branch
    cd_sample do
      `git checkout master`
      assert_equal "master", Gitodo::GitService.current_branch
    end
  end

  def test_is_git_repo_should_return_true_for_git_repo
    cd_sample do
      assert Gitodo::GitService.is_git_repo
    end
  end
end
