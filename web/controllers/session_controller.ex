defmodule SimpleAuth.SessionController do
  use SimpleAuth.Web, :controller

  plug :scrub_params, "session" when action in ~w(create)a

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    if(email && password)do
        login_user(conn, email, password)
      else
        render conn, "new.html"
    end
  end

def login_user(conn, email, password)do
  case SimpleAuth.Auth.login_by_email_and_pass(conn, email, password) do
    {:ok, conn} ->
      conn
      |> put_flash(:info, "You're now signed in!")
      |> redirect(to: order_path(conn, :index))
    {:error, _reason, conn} ->
      conn
      |> put_flash(:error, "Invalid email/password combination")
      |> render("new.html")
  end
end
  def delete(conn, _) do
    conn
    |> SimpleAuth.Auth.logout
    |> put_flash(:info, "See you later!")
    |> redirect(to: page_path(conn, :index))
  end
end
