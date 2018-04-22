#!/bin/bash

if [ -z "$2" ]; then 
for cookbook in `ls /home/ec2-user/chef-repo/cookbooks`; do 
    cd /home/ec2-user/chef-repo/cookbooks
    knife cookbook upload $cookbook &>/dev/null
    if [ $? -eq 0 ]; then 
        echo "Cookbook $cookbook Upload -- SUCCESS"
    else
        echo "Cookbook $cookbook Upload -- FAILURE"
        exit 1
    fi
done

else
	cd /home/ec2-user/chef-repo
	knife cookbook upload $2
	if [ $? -eq 0 ]; then 
        echo "Cookbook $2 Upload -- SUCCESS"
    else
        echo "Cookbook $2 Upload -- FAILURE"
        exit 1
    fi
fi

ssh -i ~/devops.pem -l ec2-user $1 'sudo chef-client'
