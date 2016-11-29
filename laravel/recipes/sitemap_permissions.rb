node[:deploy].each do |application, deploy|
  script "file_permissions" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    chown -R apache:apache public
    EOH
  end
end
