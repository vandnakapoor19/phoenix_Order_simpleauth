defmodule SimpleAuth.Router do
  use SimpleAuth.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :with_session do
  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.LoadResource
  plug SimpleAuth.CurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # ...
  pipeline :login_required do
  end
  pipeline :admin_required do
  end

    # web/router.ex
    # ...
    scope "/", SimpleAuth do
     pipe_through [:browser, :with_session]

     get "/", PageController, :index

     resources "/sessions", SessionController, only: [:new, :create, :delete]

     resources "/users", UserController, only: [:show, :new, :create]

    end
# Other scopes may use custom stacks.
  # scope "/api", SimpleAuth do
  #   pipe_through :api
  # end
end
