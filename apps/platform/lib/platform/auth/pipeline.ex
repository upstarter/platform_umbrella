defmodule Auth.Pipeline.Browser do
  use Guardian.Plug.Pipeline,
    otp_app: :designers,
    error_handler: Auth.ErrorHandler,
    module: Auth.Guardian
  # If there is a session token, validate it
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  # If there is an authorization header, validate it
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, ensure: true, allow_blank: true
  plug Guardian.Plug.EnsureAuthenticated
end

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
