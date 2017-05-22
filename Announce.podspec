Pod::Spec.new do |s|
 s.name = 'Announce'
 s.version = '1.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'A fsimple framework to display alert and notification messages in Swift'
 s.homepage = 'https://github.com/corujautx'
 s.social_media_url = 'https://twitter.com/corujautx'
 s.authors = { "Vitor Travain" => "vitor.travain.aguiar@gmail.com" }
 s.source = { :git => "https://github.com/cookiecutter-swift/Announce.git", :tag => "v"+s.version.to_s }
 s.platforms     = { :ios => "8.0", :osx => "10.10", :tvos => "9.0", :watchos => "2.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/*.swift"
     ss.framework  = "Foundation"
 end

end
