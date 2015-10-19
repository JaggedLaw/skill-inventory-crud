require_relative '../test_helper'

class Skill
  attr_reader :title,
              :id

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
  end

end

class SkillTest < Minitest::Test

  def test_attributes_are_assigned_correctly
    skill = Skill.new({ :id          => 1,
                        :title       => "My Secret Skill"})

    #binding.pry
    assert_equal 1, skill.id
    assert_equal "My Secret Skill", skill.title
  end

end
