node[:deploy].each do |application, deploy|
  script "storage_permissions" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    chown -R www-data:www-data app/storage
    php artisan cache:clear
    chmod -R 777 app/storage
    composer dump-autoload
    EOH
  end
end
