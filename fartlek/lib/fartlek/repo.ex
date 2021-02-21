defmodule Fartlek.Repo do
  use Ecto.Repo,
    otp_app: :fartlek,
    adapter: Ecto.Adapters.Postgres
end
