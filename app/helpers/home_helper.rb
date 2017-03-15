module HomeHelper
  def relationship_content user, relationship, quantity
    users = user.try(relationship).size
    content = ""
    if users != 0
      user.try(relationship).limit(quantity).each do |fl|
        content << "<p> <a href='#{user_path(fl)}'>#{fl.full_name}</a> </p>"
      end
    end
    if quantity < users
      content << "<a href='#' data-toggle='modal'
        data-target='##{relationship}-modal' > ...and #{users - quantity} user </a>"
    end
    content.html_safe
  end
end
