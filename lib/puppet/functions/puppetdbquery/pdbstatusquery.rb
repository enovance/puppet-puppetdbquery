# This is an autogenerated function, ported from the original legacy version.
# It /should work/ as is, but will not have all the benefits of the modern
# function API. You should see the function docs to learn how to add function
# signatures for type safety and to document this function using puppet-strings.
#
# https://puppet.com/docs/puppet/latest/custom_functions_ruby.html
#
# ---- original file header ----

# ---- original file header ----
#
# @summary
#       Perform a PuppetDB node status query
#
#    The first argument is the node to get the status for.
#    Second argument is optional, if specified only return that specific bit of
#    status, one of 'name', 'deactivated', 'catalog_timestamp' and 'facts_timestamp'.
#
#    Returns an array of hashes or a array of strings if second argument is supplied.
#
#    Examples:
#    # Get status for foo.example.com
#    pdbstatusquery('foo.example.com')
#    # Get catalog_timestamp for foo.example.com
#    pdbstatusquery('foo.example.com', 'catalog_timestamp')
#
Puppet::Functions.create_function(:'puppetdbquery::pdbstatusquery') do
  # @param args
  #   The original array of arguments. Port this to individually managed params
  #   to get the full benefit of the modern function API.
  #
  # @return [Data type]
  #   Describe what the function returns here
  #
  dispatch :default_impl do
    # Call the method named 'default_impl' when this is matched
    # Port this to match individual params for better type safety
    repeated_param 'Any', :args
  end


  def default_impl(*args)
    

    raise(Puppet::ParseError, "pdbquery(): Wrong number of arguments " +
      "given (#{args.size} for 1 or 2)") if args.size < 1 or args.size > 2

    Puppet::Parser::Functions.autoloader.load(:pdbquery) unless Puppet::Parser::Functions.autoloader.loaded?(:pdbquery)

    node, status = args

    ret = function_pdbquery(["status/nodes/#{node}"])
    if status then
      ret[status]
    else
      ret
    end
  
  end
end
