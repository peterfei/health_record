require 'test_helper'
require 'minitest/autorun'
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  describe "测试User" do
    before{
       
      Fabricate(:user)
      
    }
    it "是否有值" do
      # expect(Floor.count).to_be :>,0
      #binding.pry
      User.count.must_be :>=,1

    end

    
  end
end