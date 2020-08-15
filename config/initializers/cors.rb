Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins /^(.*\.|)hwcdn\.net$/

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

Rails.application.config.hosts << /.*\.herokuapp\.com/
Rails.application.config.hosts << /.*\.hwcdn\.net/
