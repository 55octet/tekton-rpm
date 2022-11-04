Name:           test
Version:        0.0.1
Release:        1%{?dist}
Summary:        test script
BuildArch:      noarch

License:        none
Source0:        %{name}-%{version}.tar.gz

Requires:       bash

%description
Test rpm script

%prep
%setup -q

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/%{_bindir}
cp %{name}.sh %{buildroot}/%{_bindir}

%clean
rm -rf %{buildroot}

%files
%{_bindir}/%{name}.sh

%changelog
* Thu Nov   3 2022 DJR
- 0.0.1
- Initial release
