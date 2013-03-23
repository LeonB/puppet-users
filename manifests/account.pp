define users::account(
	$allowdupe = false,
	$attribute_membership = undef,
	$attributes = undef,
	$auth_membership = undef,
	$auths = undef,
	$comment = undef,
	$ensure = undef,
	$expiry = undef,
	$gid = undef,
	$groups = undef,
	$home = "/home/${name}",
	$ia_load_module = undef,
	$iterations = undef,
	$key_membership = undef,
	$keys = undef,
	$managehome = true,
	$membership = 'minimum',
	$password = undef,
	$password_max_age = undef,
	$password_min_age = undef,
	$profile_membership = undef,
	$profiles = undef,
	$project = undef,
	$provider = undef,
	$role_membership = undef,
	$roles = undef,
	$salt = undef,
	$shell = undef,
	$system = false,
	$uid,
) {

	# be aware of this bug: https://projects.puppetlabs.com/issues/19090

	if $gid {
		$group = $name
		if is_numeric($gid) {
			group { $name:
				gid => $gid,
			}
		} else {
			$group = $gid
			group { $gid:
				gid => $uid,
			}
		}
	} else {
		$group = $name
		group { $name:
			gid => $uid,
		}
	}

    # force user to be absent before group http://projects.puppetlabs.com/issues/9622
    User[$name] -> Group[$group]

	user { $name:
		allowdupe => $allowdupe,
		attribute_membership => $attribute_membership,
		attributes => $attributes,
		auth_membership => $auth_membership,
		auths => $auths,
		comment => $comment,
		ensure => $ensure,
		expiry => $expiry,
		gid => $gid,
		groups => $groups,
		home => $home,
		ia_load_module => $ia_load_module,
		# iterations => $iterations,
		key_membership => $key_membership,
		keys => $keys,
		managehome => $managehome,
		membership => $membership,
		name => $name,
		password => $password,
		password_max_age => $password_max_age,
		password_min_age => $password_min_age,
		profile_membership => $profile_membership,
		profiles => $profiles,
		project => $project,
		provider => $provider,
		role_membership => $role_membership,
		roles => $roles,
		# salt => $salt,
		shell => $shell,
		system => $system,
		uid => $uid,
	}

	if $home {
		file { $home:
			ensure  => $ensure ? { present => directory, default => $ensure },
			force   => $true,
			owner   => $uid,
			group   => $group,
			mode    => 0640; # rwx,rx
		}
	}

}
