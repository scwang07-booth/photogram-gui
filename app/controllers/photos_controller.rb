class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})

    render({:template => "photo_templates/index.html.erb"})
  end

  def photo_details
    photo_id = params.fetch("photo_id")
    @list_of_comments = Comment.where({:photo_id => photo_id})

    matching_photos = Photo.where({:id => photo_id})
    @the_photo = matching_photos.first
    render({:template => "photo_templates/details.html.erb"})
  end
end
