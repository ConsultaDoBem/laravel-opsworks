node[:deploy].each do |application, deploy|
  script "storage_permissions" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    chown -R www-data:www-data app/storage
    php composer.phar install --no-dev --no-interaction --prefer-dist
    find app/storage -type d -exec chmod 777 {} \;
    find app/storage -type f -exec chmod 777 {} \;
    EOH
  end
end
