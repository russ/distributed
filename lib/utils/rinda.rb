module Distributed
	module Utils
		module Rinda
			def self.register_or_renew(options = {})
				options = handle_options(options)
				begin
					ring_server.take([options[:space], options[:klass_def], nil, nil], options[:timeout])
				rescue Exception => e
					# Do nothing for now
				end
				register(options)
			end

			def self.register(options = {})
				options = handle_options(options)
				ring_server.write([options[:space], options[:klass_def], options[:object], options[:description]], ::Rinda::SimpleRenewer.new)
			end

			def self.ring_server
				# DRb.install_acl(ACL.new)
				::DRb.start_service
				rs = ::Rinda::RingFinger.primary
				rs
			end

			def self.read(options = {})
				options = handle_options(options)
				ring_server.read([options[:space], options[:klass_def], nil, options[:description]], options[:timeout])[2]
			end

		private

			def self.handle_options(options = {})
				{ :space => nil, :klass_def => nil, :object => nil, :description => nil, :timeout => Distributed::Config.timeout }.merge(options)
			end
		end
	end
end
