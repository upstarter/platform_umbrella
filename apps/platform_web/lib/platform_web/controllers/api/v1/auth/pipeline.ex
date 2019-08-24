defmodule PlatformWeb.Auth.Pipeline do
  alias PlatformWeb.ErrorHandler

  use Guardian.Plug.Pipeline,
    otp_app: :platform,
    error_handler: ErrorHandler,
    module: PlatformWeb.Auth.Guardian

  # If there is a session token, validate it
  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  # If there is an authorization header, validate it
  plug(Guardian.Plug.VerifyHeader, realm: "Bearer", claims: %{"typ" => "access"})
  plug(Guardian.Plug.VerifyCookie)

  plug(Guardian.Plug.EnsureAuthenticated,
    key: :default,
    claims: %{
      "typ" => "access",
      handler: PlatformWeb.Auth.HttpErrorHandler
    }
  )

  # Load the user if either of the verifications worked
  plug(Guardian.Plug.LoadResource)
  # plug(PlatformWeb.Plug.RememberMe)
end

# Another argument that came up a lot, was that using JWT for sessions is still
# fine in a microservice architecture. This one is also wrong, but is a bit too
# complex to fit into a flowchart.

# In a microservice architecture where the client talks directly to the services, you will have roughly two types of services:
#
# Stateful services: Something that has a concept of a session or persistence,
# like a chat service. Stateless services: Something that does not have a
# concept of a session, but rather performs individual self-contained tasks,
# like a video transcoding service. You don't need to use JWT token as a session
# in either case. For a stateless service, there's no session at all, so you
# simply have the application server hand out short-lived, single-use tokens for
# each individual authorized operation.

# For a stateful service, you hand out a new short-lived, single-use token for
# each service - which is then exchanged on the service itself, for a session on
# that specific service. You never use the token itself as the session.

# In a microservice architecture where the client only talks to the application
# server, none of this as relevant, as there's no concept of a "session" between
# services - it's all individual, self-contained actions from the same
# origin(s). It's probably fine to use JWT tokens there, even if they're not
# optimal for this kind of case - you're just not using them as sessions.

# WITH PLUG

# # If a session is loaded the token/resource/claims will be put into the session and connection
# # If no session is loaded, the token/resource/claims only go onto the connection
# conn = MyApp.Guardian.Plug.sign_in(conn, resource)
#
# # Optionally with claims and options
# conn = MyApp.Guardian.Plug.sign_in(conn, resource, %{some: "claim"}, ttl: {1, :minute})
#
# # remove from session (if fetched) and revoke the token
# # can also clear the remember me token, if the option :clear_remember_me is set
# conn = MyApp.Guardian.Plug.sign_out(conn)
#
# # Set a "refresh" token directly on a cookie.
# # Can be used in conjunction with `Guardian.Plug.VerifyCookie`
# conn = MyApp.Guardian.Plug.remember_me(conn, resource)
#
# # Fetch the information from the current connection
# token = MyApp.Guardian.Plug.current_token(conn)
# claims = MyApp.Guardian.Plug.current_claims(conn)
# resource = MyApp.Guardian.Plug.current_resource(conn)

# WITHOUT PLUG

# # encode a token for a resource
# {:ok, token, claims} = MyApp.Guardian.encode_and_sign(resource)
#
# # decode and verify a token
# {:ok, claims} = MyApp.Guardian.decode_and_verify(token)
#
# # revoke a token (use GuardianDb or something similar if you need revoke to actually track a token)
# {:ok, claims} = MyApp.Guardian.revoke(token)
#
# # Refresh a token before it expires
# {:ok, _old_stuff, {new_token, new_claims}} = MyApp.Guardian.refresh(token)
#
# # Exchange a token of type "refresh" for a new token of type "access"
# {:ok, _old_stuff, {new_token, new_claims}} = MyApp.Guardian.exchange(token, "refresh", "access")
#
# # Lookup a resource directly from a token
# {:ok, resource, claims} = MyApp.Guardian.resource_from_token(token)
