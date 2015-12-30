node[:deploy].each do |application, deploy|
  script "migration-prd" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    php artisan migrate --env=production
    EOH
  end
end
