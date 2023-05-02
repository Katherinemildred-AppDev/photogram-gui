class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    #for reference, should send people a 404 or if then for nil
    # if the_user == nil
    # redirect_to ("/404") or ("/users"), etc.
    #else

    render({ :template => "user_templates/show.html.erb" })

    # end (if we were to do the if then for nil)

  end

  def create
    new_username = params.fetch("newest_user")

    newest_user = User.new
    newest_user.username = new_username
    newest_user.id = User.all.last.id + 1

    newest_user.save

    #matching_usernames = User.where({ :username => new_username})
    #@the_user = matching_usernames.at(0)

    if newest_user == nil
      redirect_to("/404")
    else
      next_url = "/users/" + newest_user.username
      redirect_to(next_url)
    end

    def update

      #/updated_username?new_username=binnues607

      url_username = params.fetch("updated_username")

      matching_usernames = User.where({ :username => url_username })

      @the_user = matching_usernames.at(0)

      input_new_username = params.fetch("new_username")

      the_user.username = input_new_username

      the_user.save

      #render({:template=> "user_templates/update.html.erb"})

      next_url = "/users/" + the_user.username
      redirect_to(next_url)
    end
  end
end
