defmodule FartlekWeb.UserControllerTest do
  use FartlekWeb.ConnCase

  alias Fartlek.Accounts
  alias Fartlek.Accounts.User

  @create_attrs %{
    display_name: "some display_name",
    email: "original@test.com",
    password: "some password"
  }
  @invalid_attrs %{display_name: nil, email: nil, encrypted_password: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)

      assert %{"email" => "original@test.com", "token" => token} =
               json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    %{user: user}
  end
end
