name 'DEV'
description 'The development environment'
cookbook  'example1' , '= 0.1.1'
override_attributes 'app' => { 'DBIP' => 'env.host' }
