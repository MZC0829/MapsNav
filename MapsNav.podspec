
Pod::Spec.new do |s|

s.name         = "MapsNav"
s.version      = "1.0.0"
s.summary      = "Multiple map navigation."
s.description  = "You can use a variety of map navigation."
s.homepage     = "https://github.com/MZC0829/MapsNav"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "maizhichao" => "1005756105@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/MZC0829/MapsNav.git", :tag => s.version }
s.source_files  = ["MapsNav/Nav.swift", "MapsNav/Extension.swift"]
s.requires_arc = true
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
