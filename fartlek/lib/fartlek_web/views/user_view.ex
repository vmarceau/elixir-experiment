defmodule FartlekWeb.UserView do
  use FartlekWeb, :view
  alias FartlekWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("token.json", %{user: user, token: token}) do
    %{
      data: %{
        email: user.email,
        token: token
      }
    }
  end

  def render("user.json", %{user: user}) do
    %{
      email: user.email,
      display_name: user.display_name
    }
  end
end
