class AddAvatarToPhoto < ActiveRecord::Migration
  def change
    add_attachment :photos, :avatar
  end
end
