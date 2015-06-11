Pod::Spec.new do |s|
  s.name             = "ARFramesInGridCalculator"
  s.version          = "0.3.1"
  s.summary          = "ARFramesInGridCalculator is a simple tool to calculate frames in a grid."
  s.description      = <<-DESC
                       ARFramesInGridCalculator is a single class that will calculate frames in a grid that you specified. Useful for placing buttons, images, textfields, etc. Your designer changed his mind? ARFramesInGridCalculator makes it really simple to adjust the layout to match design specifications. And it makes it really easy to display your content dynamically based on the available bounds and number of items.
                       DESC
  s.homepage         = "https://github.com/GFunkloostar/ARFramesInGridCalculator"
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
end
