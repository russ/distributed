# config = { :app_name => 'myapp', :timeout => 0 }

module Distributed
	def self.const_missing(const)
		Distributed::Utils::Rinda.read(:klass_def => "#{const}".to_sym)
	end
end
