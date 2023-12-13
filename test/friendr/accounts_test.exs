defmodule Friendr.AccountsTest do
  use Friendr.DataCase

  alias Friendr.Accounts

  describe "users" do
    alias Friendr.Accounts.Users

    import Friendr.AccountsFixtures

    @invalid_attrs %{current_location: nil, name: nil, username: nil, password: nil, email: nil, DoB: nil, phone_number: nil, about_me: nil, interests: nil, dislikes: nil}

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Accounts.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Accounts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{current_location: "some current_location", name: "some name", username: "some username", password: "some password", email: "some email", DoB: "some DoB", phone_number: "some phone_number", about_me: "some about_me", interests: "some interests", dislikes: "some dislikes"}

      assert {:ok, %Users{} = users} = Accounts.create_users(valid_attrs)
      assert users.current_location == "some current_location"
      assert users.name == "some name"
      assert users.username == "some username"
      assert users.password == "some password"
      assert users.email == "some email"
      assert users.DoB == "some DoB"
      assert users.phone_number == "some phone_number"
      assert users.about_me == "some about_me"
      assert users.interests == "some interests"
      assert users.dislikes == "some dislikes"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{current_location: "some updated current_location", name: "some updated name", username: "some updated username", password: "some updated password", email: "some updated email", DoB: "some updated DoB", phone_number: "some updated phone_number", about_me: "some updated about_me", interests: "some updated interests", dislikes: "some updated dislikes"}

      assert {:ok, %Users{} = users} = Accounts.update_users(users, update_attrs)
      assert users.current_location == "some updated current_location"
      assert users.name == "some updated name"
      assert users.username == "some updated username"
      assert users.password == "some updated password"
      assert users.email == "some updated email"
      assert users.DoB == "some updated DoB"
      assert users.phone_number == "some updated phone_number"
      assert users.about_me == "some updated about_me"
      assert users.interests == "some updated interests"
      assert users.dislikes == "some updated dislikes"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_users(users, @invalid_attrs)
      assert users == Accounts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_users(users)
    end
  end
end
