class Like < ActiveRecord::Base

  belongs_to :photo
  belongs_to :user

  def self.toggle(photo, user)
    like = Like.find_by_user_id_and_photo_id(user.id, photo.id)

    if like
      like.destroy
    else
      like = Like.new
      like.photo = photo
      like.user = user
      like.save
    end

    like
  end

end
