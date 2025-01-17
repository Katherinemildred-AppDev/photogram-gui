Rails.application.routes.draw do

get("/users", {:controller=> "users", :action=> "index"})

get("/users/:path_username", {:controller => "users", :action=> "show"})

get("/photos", {:controller=> "photos", :action=>"index"})

get("/photos/:path_photo", {:controller=>"photos", :action=>"show"})

get("/delete_photo/:path_id", {:controller=>"photos", :action=>"delete"})

get("/insert_photo", {:controller=>"photos", :action=>"create"})

get("/update_photo/:path_modify", {:controller=>"photos", :action=>"update"})

get("/insert_comment_record/:new_comment", {:controller=>"photos", :action=>"add_comment"})


get("/insert_user_record", {:controller=>"users", :action=>"create"})

get("/updated_username/:user_id", {:controller=>"users", :action=>"update"})

get("/", {:controller=> "users", :action=> "index"})

end
