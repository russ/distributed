require 'rubygems'
require 'spec'
require 'spec/mocks'
require 'activerecord'
require 'sqlite3'

require File.join(File.dirname(__FILE__), '..', 'init')
require File.join(File.dirname(__FILE__), 'user')

ActiveRecord::Base.observers = :user_observer
ActiveRecord::Base.instantiate_observers

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.establish_connection(config['sqlite'])

load(File.dirname(__FILE__) + '/schema.rb')
