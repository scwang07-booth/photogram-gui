Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "user_details" })

  get("/photos/", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "photo_details" })

end
