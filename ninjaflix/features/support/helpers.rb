module Helpers
  def getToken
    # timeout recebe 2 segundos (valor inteiro 2) e executa duas vezes
    2.times do
      # a variável getLocalStorageAuth recebe o script JS que busca o default_auth_token do Local Storage
      getLocalStorageAuth = 'return window.localStorage.getItem("default_auth_token");'

      # executa na página o script da variável getLocalStorageAuth
      @token = page.execute_script(getLocalStorageAuth)

      break if @token != nil

      sleep 1
    end

    # retorna o valor do token
    @token
  end
end
