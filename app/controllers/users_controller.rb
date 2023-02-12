class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def user_details
    # Parameters: {"path_username" => "anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({:username=>url_username})
    @the_user = matching_usernames.first
    if @the_user == nil
      redirect_to("/users")
    else
      render({ :template => "user_templates/details.html.erb"})
    end
  end

  def add_user
    url_username = params.fetch("query_user")

    matching_usernames = User.where({:username=>url_username})
    new_user = matching_usernames.first
    if new_user == nil
      @the_user = User.new
      @the_user.username = url_username
      @the_user.save
      render({ :template => "user_templates/details.html.erb"})
    else
      @the_user = matching_usernames.first
      render({ :template => "user_templates/details.html.erb"})
    end
  end

  def update_username
    url_username = params.fetch("path_username")
    new_username = params.fetch("query_username")
    matching_usernames = User.where({:username=>url_username})
    the_user = matching_usernames.first
    the_user.username = new_username
    the_user.save
    redirect_to("/users/"+the_user.username)
  end
end
