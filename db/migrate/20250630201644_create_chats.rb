class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :chats, id: :string, default: -> { "uuid()" }, limit: 36 do |t|
      t.string :model_id

      t.timestamps
    end
  end
end
