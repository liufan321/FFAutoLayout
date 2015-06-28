Pod::Spec.new do |s|
  s.name         = "FFAutoLayout"
  s.version      = "1.0.0"
  s.summary      = "Simple Autolayout extension in Swift 2.0"
  s.homepage     = "https://github.com/liufan321/FFAutoLayout"
  s.license      = "MIT"
  s.author       = { "Fan Liu" => "liufan321@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/liufan321/FFAutoLayout.git", :tag => "1.0.0" }
  s.source_files = "Source/*.swift"
  s.requires_arc = true
end
