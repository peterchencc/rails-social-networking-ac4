class Photo < ActiveRecord::Base

  validates_presence_of :user_id, :avatar

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments, :dependent => :destroy


  has_many :likes
  has_many :like_users, :through => :likes, :source => "user"

  def can_delete_by?(u)
    self.user == u
  end
end
