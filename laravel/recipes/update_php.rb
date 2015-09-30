case node[:platform]
when "rhel", "fedora", "suse", "centos", "amazon"

  bad_packages =  ["php*"]

  bad_packages.each do |pkg|
    package pkg do
      action :remove
    end
  end

  remote_file "#{Chef::Config[:file_cache_path]}/webtatic_repo_latest.rpm" do
    source "http://mirror.webtatic.com/yum/el6/latest.rpm"
    action :create
  end

  rpm_package "jmxtrans" do
    source "#{Chef::Config[:file_cache_path]}/webtatic_repo_latest.rpm"
    action :install
  end


  good_packages =  ["php54w", "php54w-cli", "php54w-common", "php54w-gd", "php54w-ldap", "php54w-mbstring", "php54w-mcrypt", "php54w-mysql", "php54w-pdo"]

  good_packages.each do |pkg|
    package pkg do
      action :install
    end
  end



  # uninstall php
  # script "uninstall_php" do
  #   interpreter "bash"
  #   user "root"
  #   cwd "/"
  #   code <<-EOH
  #   yum remove php*
  #   EOH
  # end

  # install yum repo
  # script "install_yum_repo" do
  #   interpreter "bash"
  #   user "root"
  #   cwd "/"
  #   code <<-EOH
  #   rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
  #   EOH
  # end

  # install php54
  # script "install_php54" do
  #   interpreter "bash"
  #   user "root"
  #   cwd "/"
  #   code <<-EOH
  #   yum install php54w php54w-cli php54w-common php54w-gd php54w-ldap php54w-mbstring php54w-mcrypt php54w-mysql php54w-pdo
  #   EOH
  # end
end