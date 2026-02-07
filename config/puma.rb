# frozen_string_literal: true

max_threads = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads = ENV.fetch("RAILS_MIN_THREADS", max_threads)
threads min_threads, max_threads

environment ENV.fetch("RAILS_ENV") { "production" }

port ENV.fetch("PORT") { 3000 }
bind "tcp://0.0.0.0:#{ENV.fetch("PORT") { 3000 }}"

workers ENV.fetch("WEB_CONCURRENCY", 1)

preload_app!

plugin :tmp_restart
