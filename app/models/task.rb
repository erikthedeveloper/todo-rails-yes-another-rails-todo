class Task < ActiveRecord::Base

  belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by'
  belongs_to :assigned_to_user, class_name: 'User', foreign_key: 'assigned_to'

  mount_uploader :image, ImageUploader

  # TODO: Add 3 Validations (using 2 types)
  validates_presence_of :title, :created_by, :assigned_to
  validates_associated :created_by_user, :assigned_to_user

  # TODO: Implement functionality to upload image files for at least one of your resources using CarrierWave . Add a file field to the form for the resource, and display the uploaded image on the show page for the resource.

  def get_description
    description.empty? ? "No Description..." : description
  end

  def get_created_at
    Time.at(created_at).strftime("%a, %b %d")
  end

end
