
if `ps -ef | grep /opt/apache-tomcat-8.5.28 | grep -v grep` != ""
    execute 'Stop TOmcat' do
        command '/opt/apache-tomcat-8.5.28/bin/shutdown.sh'
    end
else
    package 'java-1.8.0-openjdk'
end

remote_file '/opt/apache-tomcat-8.5.28.tar.gz' do
    source 'http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.28/bin/apache-tomcat-8.5.28.tar.gz'
    action :create
end 

execute 'Extract tomcat' do 
    command 'cd /opt && tar xf apache-tomcat-8.5.28.tar.gz'
end 

FILES=Dir["/opt/apache-tomcat-8.5.28/webapps/*"]
FILES.each do |lfile|
    if File.file?("#{lfile}")
        file "#{lfile}" do 
            action :delete
        end
    elsif File.directory?("#{lfile}") 
        directory "#{lfile}" do 
            recursive true
            action :delete
        end
    end
end

remote_file '/opt/apache-tomcat-8.5.28/lib/mysql-connector-java-5.1.40.jar' do
    source 'https://github.com/cit-latex/stack/raw/master/mysql-connector-java-5.1.40.jar'
    action :create
end 

remote_file '/opt/apache-tomcat-8.5.28/webapps/student.war' do
    source 'https://github.com/cit-latex/stack/raw/master/student.war'
    action :create
end 

template '/opt/apache-tomcat-8.5.28/conf/context.xml' do
    source 'context.xml.erb'
    action :create
end

if `ps -ef | grep /opt/apache-tomcat-8.5.28 | grep -v grep` != ""
    execute 'Stop TOmcat' do
        command '/opt/apache-tomcat-8.5.28/bin/shutdown.sh'
    end
    execute 'Stop TOmcat' do
        command '/opt/apache-tomcat-8.5.28/bin/startup.sh'
    end
else
    execute 'Stop TOmcat' do
        command '/opt/apache-tomcat-8.5.28/bin/startup.sh'
    end
end


###