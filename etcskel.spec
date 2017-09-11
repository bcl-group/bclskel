Summary: skelton user dot files
Name: etcskel
Version: 6.0.0
Release: 1vl5bcl4
License: public domain
Group: Base
Source: bclskel-%{version}.tar.bz2
BuildRoot: /tmp/etcskel-root
Requires: bash
BuildArchitectures: noarch

%description
This is part of the Base Red Hat system.  It contains the files that
go in /etc/skel, which are in turn placed in every new user's home
directory when new accounts are created. 

%prep
%setup -n bclskel-%{version}

%install
make install DESTDIR=${RPM_BUILD_ROOT}

%clean
if [ "${RPM_BUILD_ROOT}X" != "X" ]; then
    rm -rf ${RPM_BUILD_ROOT}
fi

%files
%defattr(-,root,root)
%config /etc/skel
/etc/X11/xinit/xinitrc.d/install-proxy-private.sh