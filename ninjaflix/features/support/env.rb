require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"
require_relative "helpers"

# em toda aplicação (World) pega o modulo Helpers
World(Helpers)

# carregamento do arquivo de ambiente
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))

Capybara.configure do |config|
  # configuração do driver (browser) que irá executar os testes
  config.default_driver = :selenium_chrome

  # host padrão para a aplicação
  config.app_host = CONFIG["url"]

  # tempo de espera máximo para 5 segundos
  config.default_max_wait_time = 5
end
