Pod::Spec.new do |s|
  s.name         = "OGCryptoHash"
  s.version      = "0.2.2"
  s.summary      = "Wrapper around CommonCrypto hash functions: MD5, SHA1, SHA224, SHA256, SHA384, and SHA512. Supports hmac signing."
  s.homepage     = "https://github.com/OrangeGroove/OGCryptoHash"
  s.license      = { :type => "MIT" }
  s.authors      = { "Jesper" => "jesper@orangegroove.net" }
  s.source       = { :git => "https://github.com/OrangeGroove/OGCryptoHash.git", :tag => s.version.to_s }
  s.source_files = "OGCryptoHash/*.[hm]"
  s.requires_arc = true

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.9"
end
