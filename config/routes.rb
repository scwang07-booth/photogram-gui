Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "user_details" })
  get("/update_username/:path_username", {:controller=>"users", :action=>"update_username"})
  get("/insert_user_record", {:controller=> "users", :action => "add_user"})


  get("/photos/", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "photo_details" })
  get("/add_photo", {:controller=> "photos",:action=> "create"})
  get("/update_photo/:photo_id", { :controller => "photos", :action => "update_photo"})
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete_photo"})

end
