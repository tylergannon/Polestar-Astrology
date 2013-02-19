require 'test_helper'

class PeopleTest < ActiveSupport::TestCase
  setup do
    @person = create :person
  end
  
  test "it should set the year_branch_id" do
    assert_not_nil @person.year_branch_id
  end
end
