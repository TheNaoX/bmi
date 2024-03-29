workers Integer(ENV['PUMA_WORKERS'] || 2)
threads Integer(ENV['MIN_THREADS']  || 8), Integer(ENV['MAX_THREADS'] || 12)

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'
