defmodule Fartlek.AccountsTest do
  use Fartlek.DataCase

  alias Fartlek.Accounts

  describe "users" do
    alias Fartlek.Accounts.User

    @valid_attrs %{
      display_name: "some display_name",
      email: "original@test.com",
      password: "some password"
    }
    @invalid_attrs %{display_name: nil, email: nil, encrypted_password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "get_user!/1 returns the user with given id" do
      expected_user = user_fixture()
      actual_user = Accounts.get_user!(expected_user.id)
      assert %{actual_user | password: nil} == %{expected_user | password: nil}
    end

    test "get_user_by_email!/1 returns the user with given email" do
      expected_user = user_fixture()
      {:ok, actual_user} = Accounts.get_by_email(expected_user.email)
      assert %{actual_user | password: nil} == %{expected_user | password: nil}
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.display_name == "some display_name"
      assert user.email == "original@test.com"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
