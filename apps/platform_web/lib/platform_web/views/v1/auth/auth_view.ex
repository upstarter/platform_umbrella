defmodule PlatformWeb.V1.Auth.AuthView do
  use PlatformWeb, :view
  alias PlatformWeb.V1.Auth.AuthView

  def render("request.json", %{auth: auth}) do
    %{data: render_one(auth, AuthView, "req.json")}
  end

  def render("index.json", %{auths: auths}) do
    %{data: render_many(auths, AuthView, "auth.json")}
  end

  def render("create.json", %{auths: auths}) do
    %{data: render_many(auths, AuthView, "auth.json")}
  end

  def render("show.json", %{auth: auth}) do
    %{data: render_one(auth, AuthView, "auth.json")}
  end

  def render("req.json", %{auth: auth}) do
    %{access_token: auth.params["access_token"]}
  end

  def render("auth.json", %{auth: auth}) do
    %{id: auth.id, email: auth.email, password: auth.password}
  end

  def render("sign_up.json", %{auth: auth}) do
    %{
      status: :ok,
      message: "Now you can sign in using your email and password at `/api/v1/sign_in`.
        You will receive JWT token.\nPlease put this token into Authorization header
        for all authorized requests.\n"
    }
  end

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
