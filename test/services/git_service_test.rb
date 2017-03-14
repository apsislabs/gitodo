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

  def test_git_repo_root_should_be_root_from_root
    cd_sample do
      assert Gitodo::GitService.git_repo_root.end_with? "test/sample"
    end
  end

  def test_git_repo_root_should_be_root_from_subdir
    cd_sample_a do
      assert Gitodo::GitService.git_repo_root.end_with? "test/sample"
    end
  end
end
