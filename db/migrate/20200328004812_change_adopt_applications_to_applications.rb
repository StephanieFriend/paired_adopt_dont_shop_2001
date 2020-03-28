class ChangeAdoptApplicationsToApplications < ActiveRecord::Migration[5.1]
  def change
    rename_table :adopt_applications, :applications
  end
end
