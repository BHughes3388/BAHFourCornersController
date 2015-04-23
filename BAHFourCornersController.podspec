#
# Be sure to run `pod lib lint BAHFourCornersController.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BAHFourCornersController"
  s.version          = "0.0.1"
  s.summary          = "Four Corner Container Controller"
  s.description      = <<-DESC
                       A view container allowing up to 5 view controllers total, the main view controller and one for each corner.

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/BHughes3388/BAHFourCornersController"
  # s.screenshots     = "http://img.photobucket.com/albums/v235/rx7anator/Mobile%20Applications/4695aaf3-09b8-43e0-ba3f-490ba26918b0_zpszoe2ncbi.png"
  s.license          = 'MIT'
  s.author           = { "BHughes3388" => "BHughes3388@gmail.com" }
  s.source           = { :git => "https://github.com/BHughes3388/BAHFourCornersController.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'BAHFourCornersController' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
