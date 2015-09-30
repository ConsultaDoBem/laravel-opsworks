case node[:platform]
when "rhel", "fedora", "suse", "centos", "amazon"
  execute "update_php" do
    user "root"
    code <<-EOH
    yum remove php*
    rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
    yum install php54w. php54w-cli php54w-common php54w-gd php54w-ldap php54w-mbstring php54w-mcrypt php54w-mysql php54w-pdo
    EOH
  end
end