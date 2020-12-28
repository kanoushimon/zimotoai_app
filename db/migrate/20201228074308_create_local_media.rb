class CreateLocalMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :local_media do |t|
      t.string :prefecture
      t.string :site
      t.string :site_url
      t.string :intro

      t.timestamps
    end
  end
end
