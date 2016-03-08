# Concern for things that can be upvoted
module Votable
  extend ActiveSupport::Concern

  included do
    before_filter :authenticate_user!, only: [:create, :upvote]
  end
end
