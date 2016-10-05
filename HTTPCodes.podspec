#
# Be sure to run `pod lib lint HTTPCodes.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HTTPCodes'
  s.version          = '1.0.1'
  s.summary          = 'Enums for common HTTP codes.'
  s.description      = <<-DESC
                        Map your HTTP response codes to Swift enums.
                       DESC

  s.homepage         = 'https://github.com/olejnjak/HTTPCodes'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jakub Olejník' => 'olejnjak@gmail.com' }
  s.source           = { :git => 'https://github.com/olejnjak/HTTPCodes.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/olejnjak'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HTTPCodes/Classes/**/*'
end
