def r; reload! end
Pry.config.pager = false

def cp(string)
  Clipboard.copy string
end

def copy_token(user)
  Clipboard.copy user.api_client.user_token
end
