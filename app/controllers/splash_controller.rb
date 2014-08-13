class SplashController < ApplicationController

  def show
    start_time = Time.now

    statsd.increment('web.page_views')

    duration = Time.now - start_time
    statsd.histogram('statsd.increment.latency', duration)
  end
  
end
