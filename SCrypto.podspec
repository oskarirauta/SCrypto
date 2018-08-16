Pod::Spec.new do |s|
  s.name             = "SCrypto"
  s.version          = '1.0.1'
  s.license          = { :type => 'Free', :text => 'Free' }
  s.summary          = 'SCrypto Framework (Forked)'

  s.homepage         = "https://github.com/oskarirauta/SCrypto.swift"
  s.author           = { "Oskari Rauta" => "oskari.rauta@gmail.com" }
  s.source           = { :git => "https://github.com/oskarirauta/SCrypto.git", :tag => s.version.to_s }

  s.swift_version = '4.0'
  s.ios.deployment_target = '11.0'

  s.dependency 'ios-commoncrypto'

  s.source_files = [
			'SCrypto/SCrypto/SCrypto.swift',
			'SCrypto/Scrypto/Types/*.swift',
			'SCrypto/Scrypto/Extensions/*.swift'
                   ]

end
