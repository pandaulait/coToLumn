class Activity < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :receiver, polymorphic: true

  enum action_type: { commented_to_own_column: 0,
                      liked_to_own_column: 1,
                      followed_me: 2,
                      bookmarked_to_own_column: 3,
                      commented_to_own_patch: 4,
                      liked_to_own_patch: 5,
                      bookmarked_to_own_patch: 6,
                      commented_to_own_text: 7,
                      liked_to_own_text: 8,
                      bookmarked_to_own_text: 9 }
end
