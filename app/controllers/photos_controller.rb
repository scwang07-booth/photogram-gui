class PhotosController < ApplicationController
  def index
    render({:template => "photo_templates/index.html.erb"})
  end

  def photo_details
    render({:template => "photo_templates/details.html.erb"})
  end
end
