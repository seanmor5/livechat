defmodule Livechat.Repo.Migrations.AddChatsTable do
  use Ecto.Migration

  def change do
    create table(:chats, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :model, :string
    end
  end
end
