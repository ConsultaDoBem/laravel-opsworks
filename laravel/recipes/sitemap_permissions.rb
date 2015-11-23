node[:deploy].each do |application, deploy|
  script "file_permissions" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    chown -R www-data:www-data public
    EOH
  end
end
