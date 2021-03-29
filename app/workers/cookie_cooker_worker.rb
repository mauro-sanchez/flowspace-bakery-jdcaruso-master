class CookieCookerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: :cookies

  def perform(cookie_id)
    cookie = Cookie.find cookie_id
    cookie.update(ready: true)
    ActionCable.server.broadcast('cookie_channel', { oven_status: render_oven_status(cookie) })
  end

  private

  def render_oven_status(cookie)
    ApplicationController.renderer.render(partial: 'ovens/oven_status', locals: { oven: cookie.storage })
  end
end
