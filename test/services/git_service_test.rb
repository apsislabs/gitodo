require 'test_helper'

class Gitodo::GitServiceTest < Minitest::Test
  def test_should_get_current_branch
    cd_sample do
      `git checkout master`
      assert_equal "master", Gitodo::GitService.current_branch
    end
  end
end
