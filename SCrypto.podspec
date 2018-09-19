Pod::Spec.new do |s|
  s.name             = "SCrypto"
  s.version          = '4.1'
  s.license          = { :type => 'Free', :text => 'Free' }
  s.summary          = 'SCrypto Framework (Forked)'

  s.homepage         = "https://github.com/oskarirauta/SCrypto.swift"
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.authors          = { 
	  		"Maksym Shcheglov" => 'maxscheglov@gmail.com',
	  		"Oskari Rauta" => 'oskari.rauta@gmail.com'
	               }
	
  s.source           = { :git => "https://github.com/oskarirauta/SCrypto.git", :tag => s.version.to_s }

  s.swift_version = '4.2'
  s.ios.deployment_target = '11.4'

  s.source_files = [
			'SCrypto/SCrypto/SCrypto.swift',
			'SCrypto/Scrypto/Types/*.swift',
			'SCrypto/Scrypto/Extensions/*.swift'
                   ]

end
