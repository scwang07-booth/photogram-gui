Rails.application.routes.draw do

  get("/", { :controller => "user", :action => "index" })
  get("/users", { :controller => "user", :action => "index" })
  get("/users/:an_id", { :controller => "user", :action => "user_details" })

end
