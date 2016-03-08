class Post < ActiveRecord::Base
  include UserProperty
  has_many :comments

  def as_json(options = {})
    super(options.merge(include: [:user, comments: { include: :user }]))
  end
end
