case node[:platform]
when "rhel", "fedora", "suse", "centos", "amazon"
  # uninstall php
  script "uninstall_php" do
    interpreter "bash"
    user "root"
    cwd "/"
    code <<-EOH
    yum remove php*
    EOH
  end

  # install yum repo
  script "install_yum_repo" do
    interpreter "bash"
    user "root"
    cwd "/"
    code <<-EOH
    rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
    EOH
  end

  # install php54
  script "install_php54" do
    interpreter "bash"
    user "root"
    cwd "/"
    code <<-EOH
    yum install php54w php54w-cli php54w-common php54w-gd php54w-ldap php54w-mbstring php54w-mcrypt php54w-mysql php54w-pdo
    EOH
  end
end