module Helpers
  def getToken
    # a variável timeout recebe a propriedade de tempo de espera do capybara (tempo máximo para encontrar um elemento na página)
    timeout = Capybara.default_max_wait_time

    # timeout recebe 2 segundos (valor inteiro 2) e executa duas vezes
    timeout.times do
      # a variável getLocalStorageAuth recebe o script JS que busca o default_auth_token do Local Storage
      getLocalStorageAuth = 'return window.localStorage.getItem("default_auth_token");'

      # executa na página o script da variável getLocalStorageAuth
      @token = page.execute_script(getLocalStorageAuth)

      sleep 1
    end

    # retorna o valor do token
    @token
  end
end
