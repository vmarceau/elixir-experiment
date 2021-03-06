defmodule FartlekWeb.Auth.Guardian do
  use Guardian, otp_app: :fartlek

  alias Fartlek.Accounts

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Accounts.get_user!(id)
    {:ok, resource}
  end

  @spec current_user(Plug.Conn.t()) :: any
  def current_user(conn) do
    Guardian.Plug.current_resource(conn)
  end

  def authenticate(email, password) do
    with {:ok, user} <- Accounts.get_by_email(email) do
      case validate_password(password, user.encrypted_password) do
        true ->
          create_token(user)

        false ->
          {:error, :unauthorized}
      end
    end
  end

  defp validate_password(password, encrypted_password) do
    Bcrypt.verify_pass(password, encrypted_password)
  end

  defp create_token(user) do
    {:ok, token, _claims} = encode_and_sign(user)
    {:ok, user, token}
  end
end
