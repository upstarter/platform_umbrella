defmodule PlatformWeb.Router do
  use PlatformWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :guest do
  end

  pipeline :unauthorized do
  end

  pipeline :authorized do
    # plug Auth.Pipeline.Browser
    # plug Auth.CurrentUser
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", PlatformWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :home)

    get("/about", PageController, :home)
    get("/blog", PageController, :home)
    get("/contribute", PageController, :home)
    get("/portfolio", PageController, :home)
    get("/search", PageController, :home)
    get("/privacy_policy", PageController, :home)
  end

  # Other scopes may use custom stacks.
  scope "/api", PlatformWeb do
    pipe_through(:api)

    scope "/v1", V1 do
      # LEADS
      post("/leads", LeadController, :create)
      get("/blog_posts", BlogController, :blog_posts)
      get("/search", TokenController, :search)

      # PROVIDERS
      scope "/", Providers do
        resources "/providers", ProviderController, except: [:delete] do
          resources("/portfolios", PortfolioController)
          resources("/topics", TopicController, except: [:new, :edit])
        end
      end

      # TOPICS
      scope "/", Topics do
        resources("/topics", TopicController, except: [:new, :edit])
      end

      # PORTFOLIOS
      scope "/", Portfolios do
        resources("/portfolios", PortfolioController)
      end

      # USERS
      scope "/users", Users do
        scope "/" do
          pipe_through(:unauthorized)
          post("/create", UserController, :create)
          post("/sign-in", UserController, :sign_in)
        end

        scope "/" do
          pipe_through(:authorized)
          get("/sign-out", UserController, :sign_out)
          get("/me", UserController, :show)
        end
      end
    end
  end
end
