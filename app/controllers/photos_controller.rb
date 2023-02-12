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

  def create
    # Parameters: {"image_url"=>"hello", "caption_text"=>"asdf", "owner_id_field"=>"123"}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save
    redirect_to("/photos/"+a_new_photo.id.to_s)
  end

  def delete_photo
    # Parameters:
    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.first
    the_photo.destroy
    redirect_to("/photos")
  end

  def update_photo
  input_image = params.fetch("input_image")
  input_caption = params.fetch("input_caption")
  the_id = params.fetch("photo_id")
  matching_photos = Photo.where({:id=>the_id})
  the_photo = matching_photos.first
  the_photo.image = input_image
  the_photo.caption = input_caption
  the_photo.save
  redirect_to("/photos/"+the_photo.id.to_s)
  end
end
