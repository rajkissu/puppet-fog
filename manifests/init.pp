class fog {
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
}
