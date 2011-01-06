It looks like this functionality exists in Sinatra already with the <pre>:host_name => /subdomain.example.com/</pre>

sinatra-subroutes
=================

Create Sinatra routes that respond to the subdomain defined, similar to the built in user_agent option. Compiled into a gem from these sources:
http://tannerburson.com/2009/01/extracting-subdomains-in-sinatra.html
http://toms-toolbox.com/2010/04/sinatra-native-subdomain-routing/

Install
-------
<pre>
  gem install sinatra-subroutes
</pre>

Usage
-----
<pre>
require 'sinatra'
require 'sinatra-subroutes'

set :tld_size, 2 # Use this for domains such as example.co.uk, default is 1

get '/', :subdomain => /subdomain/ do
  'You're at the root of the "subdomain" subdomain'
end
</pre>


Contributing to sinatra-subroutes
---------------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2010 Daniel Westendorf. See LICENSE.txt for
further details.

