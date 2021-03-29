class CookieCookerWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
  end
end
