# Use OSUOSL mirrors as they are more stable than upstream
execute 'Update /etc/apt/sources.list' do
  command 'sed -i -e "s/archive.ubuntu.com/ubuntu.osuosl.org/g" /etc/apt/sources.list'
  only_if { platform_family?('debian') }
  not_if 'grep -q ubuntu.osuosl.org /etc/apt/sources.list'
  action :nothing
end.run_action(:run)

apt_update 'update' do
  frequency 3600
end
