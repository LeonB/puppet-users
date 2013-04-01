module Puppet::Parser::Functions
  newfunction(
    :user_home,
    :type => :rvalue,
    :doc => "Returns home directory name of user specified in args[0]"
  ) do |args|

    # make sure args[0] is a strings
    if args[0].is_a?(String)
      user = args[0]
      File.expand_path("~#{user}")

    else
      Puppet.warning "user_home: usage: user_home( user )"
      nil

    end
  end
end
