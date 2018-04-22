name "sample"
description "Sample Role"
run_list "recipe[example1]", "recipe[app::install]"
default_attributes "app" => { "DBIP" => "role.host" }

