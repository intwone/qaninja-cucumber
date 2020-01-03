module Helpers
  def getToken
    getLocalStorageAuth = 'return window.localStorage.getItem("default_auth_token");'
    page.execute_script(getLocalStorageAuth)
  end
end
