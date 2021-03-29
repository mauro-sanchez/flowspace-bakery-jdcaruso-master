class CookieCookerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: :cookies

  def perform(cookie_id)
    cookie = Cookie.find cookie_id
    cookie.update(ready: true)
  end
end
