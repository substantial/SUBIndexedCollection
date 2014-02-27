Pod::Spec.new do |s|
  s.name         = "SUBIndexedCollection"
  s.version      = "0.0.1"
  s.summary      = "Convenient collection wrapper class for use in a UICollectionViewDataSource"
  s.description  = <<-DESC
                   Convenient collection wrapper class for use in a UICollectionViewDataSource
                   DESC
  s.homepage     = "https://github.com/substantial/SUBIndexedCollection"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Shawn Dempsey" => "sndempsey@gmail.com" }
  s.source       = { :git => "https://github.com/substantial/SUBIndexedCollection.git", :tag => "0.0.1" }
  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
end
