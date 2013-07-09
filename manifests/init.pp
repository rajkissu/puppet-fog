# Class: fog
#
# Manages the installation of fog and it's dependencies.
#
# This module is required by the cloud_provisioner library.
#
class fog(
    $aws_access_key_id,
    $aws_secret_access_key
) {
    package { "fog-dep":
        name   => [ "libxslt-dev", "libxml2-dev" ],
        ensure => present,
    }

    package { "nokogiri":
        ensure   => "1.5.9",
        provider => gem,
        require  => Package["fog-dep"],
    }

    package { "fog":
        ensure   => "1.11.1",
        provider => gem,
        require  => Package["nokogiri"],
    }

    package { "net-scp":
        ensure   => present,
        provider => gem,
    }

    file { "/root/.fog":
        ensure  => file,
        content => template("fog/fog.erb"),
    }
}
