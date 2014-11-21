Pod::Spec.new do |s|
  s.name             = "ARPopScrollController"
  s.version          = "0.1.0"
  s.summary          = "A short description of ARPopScrollController."
  s.description      = <<-DESC
                       An optional longer description of ARPopScrollController

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/arrpsh/ARPopScrollController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Purushottam Shukla" => "puru.raj20@gmail.com" }
  s.source           = { :git => "https://github.com/arrpsh/ARPopScrollController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'ARPopScrollController' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end
