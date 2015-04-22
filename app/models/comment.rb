class Comment < ActiveRecord::Base

  validates_presence_of :content, :user_id, :photo_id
  belongs_to :user
  belongs_to :photo

  def can_delete_by?(u)
    self.user == u
  end
end
