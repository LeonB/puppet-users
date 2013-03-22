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
	$home = undef,
	$ia_load_module = undef,
	$iterations = undef,
	$key_membership = undef,
	$keys = undef,
	$managehome = undef,
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

	if $gid {
		if is_numeric($gid) {
			group { $name:
				gid => $gid,
			}
		} else {
			group { $gid:
				gid => $uid,
			}
		}
	} else {
		group { $name:
			gid => $uid,
		}
	}

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

}
