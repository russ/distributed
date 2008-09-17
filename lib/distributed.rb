module Distributed
	class Config
		cattr_accessor :app_name, :instance_writer => false
		@@app_name = 'myapp'

		cattr_accessor :timeout, :instance_writer => false
		@@timeout = 0
	end

	def self.const_missing(const)
		Distributed::Utils::Rinda.read(:klass_def => "#{const}".to_sym)
	end
end
