## Usage

Start the ring server daemon
	./script/ring_server

Create a ActiveRecord model that knows how to be distributed
	class User < ActiveRecord::Base
		include Distributed::Distributable
	end

Use this object across the network
	user = Distributed::User.find_by_name('Shake')
	user.save!

## Tips

To increase the speed of the object loading require the model in an initailizer
	require 'user'
