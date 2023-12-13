defmodule FriendrWeb.UsersControllerTest do
  use FriendrWeb.ConnCase

  import Friendr.AccountsFixtures

  @create_attrs %{current_location: "some current_location", name: "some name", username: "some username", password: "some password", email: "some email", DoB: "some DoB", phone_number: "some phone_number", about_me: "some about_me", interests: "some interests", dislikes: "some dislikes"}
  @update_attrs %{current_location: "some updated current_location", name: "some updated name", username: "some updated username", password: "some updated password", email: "some updated email", DoB: "some updated DoB", phone_number: "some updated phone_number", about_me: "some updated about_me", interests: "some updated interests", dislikes: "some updated dislikes"}
  @invalid_attrs %{current_location: nil, name: nil, username: nil, password: nil, email: nil, DoB: nil, phone_number: nil, about_me: nil, interests: nil, dislikes: nil}

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, ~p"/users")
      assert html_response(conn, 200) =~ "Listing Users"
    end
  end

  describe "new users" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/users/new")
      assert html_response(conn, 200) =~ "New Users"
    end
  end

  describe "create users" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/users", users: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/users/#{id}"

      conn = get(conn, ~p"/users/#{id}")
      assert html_response(conn, 200) =~ "Users #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/users", users: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Users"
    end
  end

  describe "edit users" do
    setup [:create_users]

    test "renders form for editing chosen users", %{conn: conn, users: users} do
      conn = get(conn, ~p"/users/#{users}/edit")
      assert html_response(conn, 200) =~ "Edit Users"
    end
  end

  describe "update users" do
    setup [:create_users]

    test "redirects when data is valid", %{conn: conn, users: users} do
      conn = put(conn, ~p"/users/#{users}", users: @update_attrs)
      assert redirected_to(conn) == ~p"/users/#{users}"

      conn = get(conn, ~p"/users/#{users}")
      assert html_response(conn, 200) =~ "some updated current_location"
    end

    test "renders errors when data is invalid", %{conn: conn, users: users} do
      conn = put(conn, ~p"/users/#{users}", users: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Users"
    end
  end

  describe "delete users" do
    setup [:create_users]

    test "deletes chosen users", %{conn: conn, users: users} do
      conn = delete(conn, ~p"/users/#{users}")
      assert redirected_to(conn) == ~p"/users"

      assert_error_sent 404, fn ->
        get(conn, ~p"/users/#{users}")
      end
    end
  end

  defp create_users(_) do
    users = users_fixture()
    %{users: users}
  end
end
