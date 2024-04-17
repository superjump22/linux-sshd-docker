#!/bin/bash
yum update -y
yum install -y openssh-server
rm -rf /var/cache/yum/*
mkdir -p /var/run/sshd
case "$DIST_VERSION" in
7)
	sed -e 's|^mirrorlist=|#mirrorlist=|g' \
		-e 's|^#baseurl=http://mirror.centos.org/centos|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos|g' \
		-i.bak \
		/etc/yum.repos.d/CentOS-*.repo
	;;
stream8)
	sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
		-e 's|^#baseurl=http://mirror.centos.org/$contentdir|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos|g' \
		-i.bak \
		/etc/yum.repos.d/CentOS-Stream-AppStream.repo \
		/etc/yum.repos.d/CentOS-Stream-BaseOS.repo \
		/etc/yum.repos.d/CentOS-Stream-Extras.repo \
		/etc/yum.repos.d/CentOS-Stream-PowerTools.repo
	;;
stream9)
	cat <<EOF >/usr/local/bin/update_mirror.pl
#!/usr/bin/perl

use strict;
use warnings;
use autodie;

my $mirrors = 'https://mirrors.tuna.tsinghua.edu.cn/centos-stream';

if (@ARGV < 1) {
    die "Usage: $0 <filename1> <filename2> ...\n";
}

while (my $filename = shift @ARGV) {
    my $backup_filename = $filename . '.bak';
    rename $filename, $backup_filename;

    open my $input, "<", $backup_filename;
    open my $output, ">", $filename;

    while (<$input>) {
        s/^metalink/# metalink/;

        if (m/^name/) {
            my (undef, $repo, $arch) = split /-/;
            $repo =~ s/^\s+|\s+$//g;
            ($arch = defined $arch ? lc($arch) : '') =~ s/^\s+|\s+$//g;

            if ($repo =~ /^Extras/) {
                $_ .= "baseurl=${mirrors}/SIGs/\$releasever-stream/extras" . ($arch eq 'source' ? "/${arch}/" : "/\$basearch/") . "extras-common\n";
            } else {
                $_ .= "baseurl=${mirrors}/\$releasever-stream/$repo" . ($arch eq 'source' ? "/" : "/\$basearch/") . ($arch ne '' ? "${arch}/tree/" : "os") . "\n";
            }
        }

        print $output $_;
    }
}
EOF
	chmod +x /usr/local/bin/update_mirror.pl
	perl /usr/local/bin/update_mirror.pl /etc/yum.repos.d/centos*.repo
	;;
*)
	echo "Unsupported version: $DIST_VERSION"
	exit 1
	;;
esac
