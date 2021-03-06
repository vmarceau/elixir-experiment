defmodule FartlekWeb.UserController do
  use FartlekWeb, :controller

  alias Fartlek.Accounts
  alias Fartlek.Accounts.User
  alias FartlekWeb.Auth.Guardian

  action_fallback FartlekWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("token.json", %{user: user, token: token})
    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render("token.json", %{user: user, token: token})
    end
  end

  def me(conn, _) do
    user = Guardian.current_user(conn)

    conn
    |> put_status(:ok)
    |> render("show.json", %{user: user})
  end
end
