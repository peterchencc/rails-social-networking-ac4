module ApplicationHelper


  def timeline_user_avater(user)
    link_to user_path(user) do
      image_tag( ( user.image ), :class => "img-rounded") + " " + user.name
    end
  end
end
