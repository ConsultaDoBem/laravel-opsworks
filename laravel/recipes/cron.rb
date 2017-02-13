node[:deploy].each do |application, deploy|
  script "file_permissions" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH

# Process queue db - Every 2 minutes
*/2 * * * * php /srv/www/monaco/current/artisan cdb:queue-process --env=production

# Process all payments - Every 2 minutes
*/2 * * * * php /srv/www/monaco/current/artisan cdb:payer-process --env=production

# Process all payments - Every 30 minutes
# */30 * * * * php /srv/www/monaco/current/artisan cdb:billet-status --env=production

# Process bankslip reminder - 6am every day
# 0 6 * * * php /srv/www/monaco/current/artisan cdb:bankslip-reminder --env=production

# Process bank slips
# 0 */1 * * * php /srv/www/monaco/current/artisan cdb:billet-status --env=production

# Process update balance  - 2am every day
0 2 * * * php /srv/www/monaco/current/artisan cdb:balance-process --env=production

# Search Indexing Full - 3am every day
0 3 * * * php /srv/www/monaco/current/artisan cdb:search-indexing --env=production


    EOH
  end
end
