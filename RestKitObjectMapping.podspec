Pod::Spec.new do |s|
  s.name         = 'RestKitObjectMapping'
  s.version      = '0.10.3.3'
  s.license      = 'Apache License, Version 2.0'
  s.summary      = 'The Object Mapping portion of RestKit, with JSON support, extracted from the main RestKit framework for use solely as a JSON<->Object mapping framework.'
  s.homepage     = 'https://github.com/levigroker/RestKitObjectMapping'
  s.author       = { 'Levi Brown' => 'levigroker@gmail.com' }
  s.source       = { :git => 'https://github.com/levigroker/RestKitObjectMapping.git', :tag => 'v0.10.3.3' }
  s.source_files = 'Code/Additions', 'Code/ObjectMapping', 'Code/Support', 'Code/Support/Parsers/JSON'

  s.ios.deployment_target = '5.0'

  s.dependency 'CocoaLumberjack',      '~> 1.6'
  s.dependency 'ISO8601DateFormatter', '>= 0.6'
  s.dependency 'SOCKit',               '~> 1.1'
end
