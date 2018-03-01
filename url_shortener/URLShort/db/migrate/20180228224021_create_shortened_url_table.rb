class CreateShortenedUrlTable < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
    end
  end
end
