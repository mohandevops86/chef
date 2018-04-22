name 'PROD'
description 'The production environment'
cookbook  'example1' , '= 0.1.0'
override_attributes 'app' => { 'DBIP' => 'env.host' }
