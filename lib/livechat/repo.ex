defmodule Livechat.Repo do
  use Ecto.Repo,
    otp_app: :livechat,
    adapter: Ecto.Adapters.Postgres
end
