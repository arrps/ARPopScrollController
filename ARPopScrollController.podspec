Pod::Spec.new do |s|
  s.name             = "ARPopScrollController"
  s.version          = "1.0.1"
  s.summary          = "A beautiful page scroll controller class."
  s.description      = <<-DESC
                       ARPopScrollController allows you to present user with a beautiful horizontal scrolling interface of a collection of UIViews. The View is customizable according to your need. Supports all resolution iPhones and iPads.
                       DESC
  s.homepage         = "https://github.com/purushukla/ARPopScrollController.git"
#s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Puru Shukla" => "puru.raj20@gmail.com" }
  s.source           = { :git => "https://github.com/purushukla/ARPopScrollController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'ARPopScrollController' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end
