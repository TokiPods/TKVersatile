#
# Be sure to run `pod lib lint TKVersatile.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKVersatile'
  s.version          = '1.1.0'
  s.summary          = 'Toki\'s versatile tools'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Toki\'s versatile tools, well!'

  s.homepage         = 'https://github.com/ZhengXianda0512/TKVersatile'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ZhengXianda0512' => 'zhengxianda0512@gmail.com' }
  s.source           = { :git => 'https://github.com/ZhengXianda0512/TKVersatile.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.3'

  # s.source_files = 'TKVersatile/Classes/**/*'

  s.subspec 'TKCyclicView' do |cyclic|
    cyclic.source_files = 'TKVersatile/Classes/TKCyclicView/**/*'
  end

  s.subspec 'TKTransparentNavigationBarViewController' do |transparentNavigationBar|
    transparentNavigationBar.source_files = 'TKVersatile/Classes/TKTransparentNavigationBarViewController/**/*'
  end
  
  s.subspec 'TKLyphardMelodyView' do |lyphardMelody|
      lyphardMelody.source_files = 'TKVersatile/Classes/TKLyphardMelodyView/**/*'
  end
  
  s.subspec 'TKRippleView' do |ripple|
      ripple.source_files = 'TKVersatile/Classes/TKRippleView/**/*'
  end
  
  # s.resource_bundles = {
  #   'TKVersatile' => ['TKVersatile/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
