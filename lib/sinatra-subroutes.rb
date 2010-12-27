# This method is heavily adapted from the Rails method of determining the subdomain.
require 'rubygems'
require 'sinatra'

require 'rack/request'

# Extracted from http://tannerburson.com/2009/01/extracting-subdomains-in-sinatra.html
# We re-open the request class to add the subdomains method
module Rack
  class Request
    def subdomains(tld_len=1) # we set tld_len to 1, use 2 for co.uk or similar
      # cache the result so we only compute it once.
      @env['rack.env.subdomains'] ||= lambda {
        # check if the current host is an IP address, if so return an empty array
        return [] if (host.nil? || /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.match(host))
        host.split('.')[0...(1 - tld_len - 2)] # pull everything except the TLD
      }.call
    end
  end
end

module Sinatra
  class Base
    class << self

      # Adapted from here: http://toms-toolbox.com/2010/04/sinatra-native-subdomain-routing/
      def subdomain(pattern)
        condition {
          if request.subdomains[0] =~ pattern
            true
          else
            false
          end
        }
      end

    end
  end
end
