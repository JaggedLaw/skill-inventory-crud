require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def create_skills(number)
    number.times do |i|
      SkillInventory.create(:title => "skill#{i+1}")
    end
    #binding.pry
  end

  def test_user_sees_index_of_skills
    create_skills(3)
    # user can view skills
    visit '/skills'
    within("h3:first") do
      assert page.has_content?("skill1")
    end
    within("h3:last") do
      assert page.has_content?("skill3")
    end
  end

  def test_user_can_update_a_skill
    create_skills(1)
    visit '/skills'
    click_link('Edit')
    fill_in('skill[title]', {:with => "updated skill"})
    click_button('Submit')
    within("h3:first") do
      assert page.has_content?("updated skill")
    end
  end

  def test_user_can_delete_a_skill
    create_skills(1)
    visit '/skills'
    click_button('delete')
    refute page.has_content?("skill1")

  end

  def test_user_can_create_new_skill
    create_skills(1)
    visit '/'
    click_link('New Skill')
    fill_in('skill[title]', {:with => "super new skill"})
    click_button('submit_skill')
    within("h3:last") do
      assert page.has_content?("super new skill")
    end

  end

  def test_user_can_view_page_with_single_skill
    create_skills(1)
    visit '/skills'
    click_link('skill1')
    assert page.has_content?("skill1")
  end

end
