node[:deploy].each do |application, deploy|
  script "migration" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    php artisan migrate --env=qa
    EOH
  end
end
