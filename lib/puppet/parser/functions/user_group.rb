require 'etc'

module Puppet::Parser::Functions
  newfunction(
    :user_group,
    :type => :rvalue,
    :doc => "Returns primary group of user specified in args[0]"
  ) do |args|

    # make sure args[0] is a strings
    if args[0].is_a?(String)
      user = args[0]
      gid = Etc.getpwnam(user).gid
      raise Puppet::ParseError, Etc.getgrgid(gid).name
      Etc.getgrgid(gid).name
    else
      Puppet.warning "user_group: usage: user_group( user )"
      nil

    end
  end
end

