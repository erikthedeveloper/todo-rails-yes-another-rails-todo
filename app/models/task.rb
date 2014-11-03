class Task < ActiveRecord::Base

  belongs_to :created_by_user, class_name: 'User', foreign_key: 'created_by'

  # TODO: Add 3 Validations (using 2 types)

  # TODO: Update the views for both resources such that a user can associate two records, as well as navigate between associated records (in both directions).

  # TODO: Prevent signed-out users from accessing the routes for at least one of your resources (still using Devise).

  # TODO: Implement functionality to upload image files for at least one of your resources using CarrierWave . Add a file field to the form for the resource, and display the uploaded image on the show page for the resource.

end
