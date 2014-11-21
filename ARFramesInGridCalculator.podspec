#
# Be sure to run `pod lib lint ARFramesInGridCalculator.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ARFramesInGridCalculator"
  s.version          = "0.2.0"
  s.summary          = "ARFramesInGridCalculator is a handy tool to create frames in a grid."
  s.description      = <<-DESC
                       This class is well documented. Read the header files for more info. I will provide a example project anytime soon.
                       DESC
  s.homepage         = "https://github.com/GFunkloostar/ARFramesInGridCalculator"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Gijs van Klooster" => "gijs@appyroad.com" }
  s.source           = { :git => "https://github.com/GFunkloostar/ARFramesInGridCalculator.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/abcgijs'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'ARFramesInGridCalculator' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
