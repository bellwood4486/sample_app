require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # RailsコンソールやIntegrationTest実行時に、carrierwaveで、
    # NameError uninitialized-constant エラーが発生するのを回避するため
    # see: http://qiita.com/h5y1m141@github/items/97e1941086c7f9f229ac  
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')] 
    
    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
