module ApplicationHelper


  def timeline_user_avater(user)
    link_to user_path(user) do
      image_tag( ( user.user_display_image ), :class => "img-rounded") + " " + user.user_display_name
    end
  end
end
