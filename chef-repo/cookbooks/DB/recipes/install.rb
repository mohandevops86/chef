package 'Installing MariaDB Server' do
    package_name 'mariadb-server'
    action :install
end

service "mariadb" do
    action [ :start, :enable ]
end

cookbook_file '/opt/student.sql' do
    source 'student.sql'
    action :create
end

execute 'Loading SQL file' do
    command 'mysql </opt/student.sql'
end

