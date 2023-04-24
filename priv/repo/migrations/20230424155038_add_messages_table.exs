defmodule Livechat.Repo.Migrations.AddMessagesTable do
  use Ecto.Migration

  def up do
    execute("CREATE TYPE role_type as ENUM ('assistant', 'user')")

    create table(:messages) do
      add :contents, :text
      add :role, :role_type
      add :in_reply_to_message_id, references(:messages)
      add :chat_id, references(:chats, type: :binary_id)

      timestamps(updated_at: false)
    end
  end

  def down do
    drop table(:messages)
    execute("DROP TYPE role_type")
  end
end
