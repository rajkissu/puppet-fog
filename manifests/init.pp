class fog {
    package { 'fog-dep':
        name   => [ "libxslt-dev", "libxml2-dev" ],
        ensure => present,
    }

    package { "fog":
        ensure   => "0.7.2",
        provider => gem,
        require  => Package['fog-dep'],
    }

    package { "net-scp":
        ensure   => present,
        provider => gem,
    }
}
