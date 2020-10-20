class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.text        :content,  null: false  
      t.references  :user,  null: false
      t.references  :category,  null: false
      t.timestamps
    end
  end
end
