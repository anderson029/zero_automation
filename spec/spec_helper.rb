require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  
  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  
  config.mock_with :rspec do |mocks|
    
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  #configurando tamanho da tela para todos os cenários do projeto
  config.before(:example) do
    page.current_window.resize_to(1280, 800)
  end

  #configurando screenshot para todos os cenários
  #exception = quando o cenário falha ele traz a excessão do erro

  config.after(:example) do |ex|
    nome_cenario = ex.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ','_')
    page.save_screenshot('log/'+ nome_cenario + '.png') #if ex.exception
  end
end

Capybara.configure do |config|
#headless = o navegador não é apresentado
  config.default_driver = :selenium_chrome_headless
  #config.default_driver = :selenium_chrome
  #config.default_driver = :selenium
  config.default_max_wait_time = 10
  config.app_host = 'https://training-wheels-protocol.herokuapp.com'
end