defmodule Aleworld.Repo do
  use Ecto.Repo,
    otp_app: :aleworld,
    adapter: Ecto.Adapters.Postgres
end
