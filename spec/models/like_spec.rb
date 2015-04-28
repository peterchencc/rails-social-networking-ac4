require "rails_helper"

RSpec.describe Like, :type => :model do

  before do
    @user = User.create!( :email => "test@example.org", :password => "12345678")
    @photo = Photo.new( :user => @user )
    @photo.save( :validate => false )
  end

  describe ".toggle" do

    it "should create new like if no existing like" do
      expect( Like.count ).to eq(0)

      Like.toggle(@photo, @user)

      expect( Like.count ).to eq(1)
      like = Like.last
      expect(like.user).to eq(@user)
      expect(like.photo).to eq(@photo)
    end


    it "should destroy like if existing like" do
      Like.create!( :user => @user, :photo => @photo)

      Like.toggle(@photo, @user)

      expect( Like.count ).to eq(0)
    end

  end

end

