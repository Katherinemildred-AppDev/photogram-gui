class UsersController < ApplicationController

def index

  matching_users = User.all

  @list_of_users= matching_users.order({:username => :asc})
  
  render({:template=> "user_templates/index.html.erb"})

end

def show

  url_username = params.fetch("path_username")
  
  matching_usernames = User.where({ :username => url_username})

  @the_user = matching_usernames.at(0)


  #for reference, should send people a 404 or if then for nil
 # if the_user == nil
     # redirect_to ("/404") or ("/users"), etc. 
  #else
   
  render({:template=>"user_templates/show.html.erb"})

   # end (if we were to do the if then for nil)


end

end
