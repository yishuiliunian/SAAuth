#
# Be sure to run `pod lib lint SAAuth.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SAAuth"
  s.version          = "0.1.0"
  s.summary          = "SAAuth帮你快速的获取QQ、微信等的第三方登陆权限"
  s.description      = <<-DESC
                       SAAuth设计用来获取第三方登陆权限。把几个常见的社交平台的IOS权限获取封装起来，省去开发者每次都再次开发的痛苦。目前支持QQ和微信，后续后加入其他平台。
                       DESC
  s.homepage         = "https://github.com/yishuiliunian/SAAuth"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "stonedong" => "yishuiliunian@gmail.com" }
  s.source           = { :git => "https://github.com/yishuiliunian/SAAuth.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SAAuth' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'DZQQLib'
  s.dependency 'DZWeChatLib'
  s.dependency 'JSONModel'
end
