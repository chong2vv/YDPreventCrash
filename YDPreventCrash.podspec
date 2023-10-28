#
# Be sure to run `pod lib lint YDPreventCrash.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name         = "YDPreventCrash"
  spec.version      = "0.2.2"
  spec.summary      = "防崩溃、性能检测等"

  spec.homepage     = "https://github.com/chong2vv/YDPreventCrash"

  spec.license      = "MIT"

  spec.author             = { "王远东" => "chong2vv@gmail.com" }

  spec.source       = { :git => "https://github.com/chong2vv/YDPreventCrash.git", :tag => "#{spec.version}" }
  spec.ios.deployment_target = '10.0'
  spec.source_files = 'YDPreventCrash/Classes/**/*'

  spec.static_framework = true
  spec.requires_arc = true
  spec.frameworks = "Foundation", "UIKit"
  spec.dependency 'YDSafeThread', '~> 0.1.0'
end
