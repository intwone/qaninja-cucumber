require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"
require_relative "helpers"

# em toda aplicação (World) pega o modulo Helpers
World(Helpers)

Capybara.configure do |config|
  # configuração do driver (browser) que irá executar os testes
  config.default_driver = :selenium_chrome

  # host padrão para a aplicação
  config.app_host = "http://localhost:8080"

  # tempo de espera máximo para 5 segundos
  config.default_max_wait_time = 5
end
