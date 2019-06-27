defmodule PlatformWeb.Router do
  use PlatformWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:fetch_session)
  end

  pipeline :unauthorized do
    plug(PlatformWeb.Auth.Pipeline)
  end

  pipeline :ensure_auth do
    # plug(Guardian.Plug.EnsureAuthenticated)
  end

  scope "/", PlatformWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :home)
  end

  # Other scopes may use custom stacks.
  scope "/api", PlatformWeb do
    pipe_through(:api)

    scope "/v1", V1 do
      # LEADS
      post("/leads", LeadController, :create)
      get("/blog_posts", BlogController, :blog_posts)

      # PROVIDERS
      scope "/", Providers do
        resources "/providers", ProviderController, except: [:delete] do
          resources("/portfolios", PortfolioController)
          resources("/topics", TopicController, except: [:new, :edit])
        end
      end

      # TOKENS
      scope "/", Tokens do
        get("/search", TokenController, :search)
      end

      # TOPICS
      scope "/", Topics do
        resources("/topics", TopicController, except: [:new, :edit])
        get("/topics_tree", TopicController, :tree)
        get("/analysis", TopicController, :analysis)
        get("/research", TopicController, :research)
        get("/strategy", TopicController, :strategy)
        get("/taxonomy", TopicController, :taxonomy)
        get("/valuation", TopicController, :valuation)
      end

      # PORTFOLIOS
      scope "/", Portfolios do
        resources("/portfolios", PortfolioController)
      end

      # AUTH
      scope "/auth", Auth do
        get("/:provider", AuthController, :request)
        get("/:provider/callback", AuthController, :callback)

        scope "/" do
          post("/create", RegistrationController, :create)
          post("/sign_in", SessionController, :sign_in)
        end

        scope "/" do
          pipe_through(:ensure_auth)
          get("/sign_out", SessionController, :sign_out)
          get("/me", AuthController, :show)
        end
      end
    end
  end
end
