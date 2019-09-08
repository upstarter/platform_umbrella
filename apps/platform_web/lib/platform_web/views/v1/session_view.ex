defmodule PlatformWeb.V1.SessionView do
  use PlatformWeb, :view

  def render("sign_in.json", %{user: user, jwt: jwt}) do
    %{
      status: :ok,
      data: %{
        token: jwt,
        email: user.email
      },
      message: "You are successfully logged in! Add this token to authorization header
        to make authorized requests."
    }
  end

  # def render("sign_out.json", _) do
  #   %{
  #     status: :ok,
  #     data: %{token: nil},
  #     message:
  #       "You have successfully signed out! You will need to signin again to enjoy using the service."
  #   }
  # end

  def render("show.json", %{jwt: jwt, user: user}) do
    %{
      jwt: jwt,
      user: user
    }
  end

  def render("error.json", _) do
    %{error: "Invalid email or password"}
  end

  def render("forbidden.json", %{error: error}) do
    %{error: error}
  end
end
