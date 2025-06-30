class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages, id: :string, default: -> { "uuid()" }, limit: 36 do |t|
      t.references :chat, null: false, foreign_key: true, type: :string
      t.string :role
      t.text :content
      t.string :model_id
      t.integer :input_tokens
      t.integer :output_tokens
      t.references :tool_call, type: :string

      t.timestamps
    end
  end
end
