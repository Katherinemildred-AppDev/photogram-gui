class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({:created_at => :desc})
    
    render({:template => "photo_templates/index.html.erb"})

  end

  def show

    #params : {path id=> "777"}

    url_id = params.fetch("path_photo")

    matching_photos= Photo.where({:id => url_id})

    @the_photo = matching_photos.at(0)

    render({:template=> "photo_templates/show.html.erb"})
  end

  def delete
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({:id=> the_id})
    
    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")

    #render({:template=> "photo_templates/delete.html.erb"})
  end

  def create
#https://3000-katherinemi-photogramgu-bg5jch1un6w.ws-us96b.gitpod.io/insert_photo?query_image=https%3A%2F%2Fwww.chicagobooth.edu%2F-%2Fmedia%2Fproject%2Fchicago-booth%2Fwhy-booth%2Fstory-hub%2Fnew-stories-2022%2Fseptember%2Fchicago-booth-ai-startup-actuate.jpg%3Fcx%3D0.4%26cy%3D0.23%26cw%3D940%26ch%3D749%26hash%3D57C36F3D5EA6E4A305347566E44A128E&query_caption=Booth+photo%21&query_owner_id=117

    input_image = params.fetch("query_image")
    input_caption= params.fetch("query_caption")
    input_owner_id= params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

   # render ({:template=> "photo_templates/create.html.erb"})

  redirect_to("/photos/")
  end

  def update
    #https://3000-katherinemi-photogramgu-bg5jch1un6w.ws-us96b.gitpod.io/update_photo/957?query_image=https%3A%2F%2Fwww.chicagobooth.edu%2F-%2Fmedia%2Fproject%2Fchicago-booth%2Fwhy-booth%2Fstory-hub%2Fnew-stories-2023%2Ffebruary-2023%2Fchicago-booth-leaders-of-color.jpg%3Fcx%3D0.42%26cy%3D0.43%26cw%3D940%26ch%3D749%26hash%3DD8012F8D8774FF3DCA39E2B4459E62BE&query_caption=Updated+caption%21
    #query_image
    #query_caption
  
    the_id = params.fetch ("path_modify")

    matching_photos = Photo.where({:id=> the_id})

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption= params.fetch("query_caption")
   # input_owner_id= params.fetch("query_owner_id", "howdy") #howdy is a fallback action. but no input id here.

   the_photo.image = input_image
   the_photo.caption= input_caption

   the_photo.save

   #render({:template=>"photo_templates/update.html.erb"})

   next_url = "/photos/" +the_photo.id.to_s
   redirect_to(next_url)

  end


end
