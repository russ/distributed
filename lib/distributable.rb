module Distributed
	module Distributable
		def self.included(base)
			unless Distributed::Config.development
				base.class_eval do
					include ::DRbUndumped
				end

				eval %{
					class Distributed::#{base}Proxy
						include Singleton
						include DRbUndumped

						def method_missing(sym, *args)
							#{base}.send(sym, *args)
						end

						def inspect
							#{base}.inspect
						end

						def to_s
							#{base}.to_s
						end
					end
				}

				Distributed::Utils::Rinda.register_or_renew(:space => Distributed::Config.app_name.to_sym, :klass_def => "#{base}".to_sym, :object => "Distributed::#{base}Proxy".constantize.instance)
			end
		end
	end
end

module DRb
  class DRbObject
    alias_method :original_inspect, :inspect
    
    def inspect
      "#{original_inspect}|#{method_missing(:inspect)}"
    end
    
    undef :id
  end
end
