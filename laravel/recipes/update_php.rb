case node[:platform]
when "rhel", "fedora", "suse", "centos", "amazon"
  execute "yum remove php*" do
    ignore_failure true
  end

  execute "rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm" do
    ignore_failure true
  end

  execute "yum install php54w. php54w-cli php54w-common php54w-gd php54w-ldap php54w-mbstring php54w-mcrypt php54w-mysql php54w-pdo" do
    ignore_failure true
  end
end