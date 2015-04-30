Pod::Spec.new do |s|
  s.name             = "ARFramesInGridCalculator"
  s.version          = "0.3.0"
  s.summary          = "ARFramesInGridCalculator is a simple tool to calculate frames in a grid."
  s.description      = <<-DESC
                       ARFramesInGridCalculator a single class that makes it really easy to create frames in a grid, for buttons, images, textfield, .. whatever. Something most developers have to do many times to display a list of items when it is not a table view or collection view. Initialize with a cell size and information about how to arrange the frames. Optionally add a initial offset and spacing and once it is set to your specific needs, you can just ask a frame for a certain index.This class is well documented. Read the header files for more info.
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
