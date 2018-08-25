defmodule PlatformWeb.V1.Providers.ProviderView do
  use PlatformWeb, :view
  alias PlatformWeb.ProviderView

  def render("index.json", %{providers: providers}) do
    %{data: render_many(providers, ProviderView, "provider.json")}
  end

  def render("show.json", %{provider: provider}) do
    %{data: render_one(provider, ProviderView, "provider.json")}
  end

  def render("provider.json", %{provider: provider}) do
    %{
      id: provider.id,
      auth_account_id: provider.auth_account_id,
      name: provider.name,
      desc: provider.desc
    }
  end
end
