defmodule PlatformWeb.Router do
  use PlatformWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    # plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:fetch_session)
  end

  pipeline :ensure_auth do
    plug(PlatformWeb.Auth.Pipeline)
  end

  scope "/", PlatformWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :home)
  end

  # Other scopes may use custom stacks.
  scope "/", PlatformWeb do
    pipe_through(:browser)

    scope "/v1", V1 do
      # LEADS
      post("/leads", LeadController, :create)
      get("/blog_posts", BlogController, :blog_posts)

      scope "/" do
        pipe_through(:ensure_auth)

        resources("/proposals", Users.ProposalsController, except: [:delete, :edit, :new, :update])
      end

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
        # options("/topics", TopicController, :options)

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
        scope "/" do
          post("/create", RegistrationController, :create)
          options("/create", RegistrationController, :options)
          post("/sign_in", SessionController, :sign_in)
        end

        scope "/" do
          pipe_through(:ensure_auth)
          post("/sign_out", SessionController, :sign_out)
          get("/me", RegistrationController, :show)
        end

        get("/:provider", RegistrationController, :request)
        get("/:provider/callback", RegistrationController, :callback)
      end
    end
  end
end
