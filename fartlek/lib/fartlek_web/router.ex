defmodule FartlekWeb.Router do
  use FartlekWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug FartlekWeb.Auth.Pipeline
  end

  scope "/api", FartlekWeb do
    pipe_through :api

    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :login
  end

  scope "/api", FartlekWeb do
    pipe_through [:api, :auth]
    get "/users/me", UserController, :me
    resources "/races", RaceController, except: [:new, :edit]
    resources "/athletes", AthleteController, except: [:new, :edit]
  end
end
