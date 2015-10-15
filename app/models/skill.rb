
class Skill
  attr_reader :title,
              :id

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
  end

end
