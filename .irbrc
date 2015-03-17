# Taken from
# https://gist.github.com/adamcrown/932231

require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8

def unbundled_require(gem)
  loaded = false

  if defined?(::Bundler)
    Gem.path.each do |gems_path|
      gem_path = Dir.glob("#{gems_path}/gems/#{gem}*").last
      unless gem_path.nil?
        $LOAD_PATH << "#{gem_path}/lib"
        require gem
        loaded = true
      end
    end
  else
    require gem
    loaded = true
  end

  #raise(LoadError, "couldn't find #{gem}") unless loaded

  loaded
end

def load_gem(gem, &block)
  begin
    if unbundled_require gem
      yield if block_given?
    end
  rescue Exception => err
    warn "Couldn't load #{gem}: #{err}"
  end
end

# Highlighting and other features
load_gem 'wirble' do
  Wirble.init
  Wirble.colorize
end

# Improved formatting for objects
load_gem 'awesome_print'

# Improved formatting for collections
load_gem 'hirb' do
  Hirb.enable
end

# Show log in Rails console
if defined? Rails
  require 'logger'
  if Rails.version =~ /^2\./ # Rails 2.3
     Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  else # Rails 3
     ActiveRecord::Base.logger = Logger.new(STDOUT) if defined? ActiveRecord
  end
end

# Enable route helpers in Rails console
if defined? Rails
  include Rails.application.routes.url_helpers
end

# Benchmarking helper (http://ozmm.org/posts/time_in_irb.html)
if defined? Benchmark
  def benchmark(times = 1)
    ret = nil
    Benchmark.bm { |x| x.report { times.times { ret = yield } } }
    ret
  end
end

# Load and configure biola_web_services gem if it exists
# Grabs configuration values from environment variables upcased and prefixed with BIOLA_WS_
load_gem 'biola_web_services' do
  BiolaWebServices.configure do |config|
    [:url, :cert_path, :key_path, :key_password, :verify_ssl, :ssl_version].each do |key|
      env_value = ENV["BIOLA_WS_#{key.upcase}"]
      config.send(:"#{key}=", env_value)# unless env_value = nil?
    end
  end
end

# Random time method
class Time
  def self.random(from=Time.at(0), to=Time.now)
    Time.at rand(to.to_f - from.to_f) + from.to_f
  end
end
