defmodule FartlekWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :fartlek,
    module: FartlekWeb.Auth.Guardian,
    error_handler: FartlekWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
