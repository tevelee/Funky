#
# Be sure to run `pod lib lint LTFunctional.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LTFunctional'
  s.version          = '0.1'
  s.summary          = 'A short description of LTFunctional.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/tevelee/LTFunctional'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tevelee' => 'laszlo.teveli@skyscanner.net' }
  s.source           = { :git => 'https://github.com/tevelee/LTFunctional.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.frameworks = 'Foundation'

  s.subspec 'Core' do |ss|
    ss.source_files = 'LTFunctional/Core/**/*'
  end

  s.subspec 'Collections' do |ss|
    ss.subspec 'Array' do |sss|
      sss.source_files = 'LTFunctional/Collections/Array/**/*'
    end

    ss.subspec 'Set' do |sss|
      sss.source_files = 'LTFunctional/Collections/Set/**/*'
    end

    ss.subspec 'Dictionary' do |sss|
      sss.source_files = 'LTFunctional/Collections/Dictionary/**/*'
    end
  end

  s.subspec 'Interface' do |ss|
    ss.subspec 'Array' do |sss|
      sss.source_files = 'LTFunctional/Interface/Array/**/*'
      sss.dependency 'LTFunctional/Core'
    end

    ss.subspec 'Set' do |sss|
      sss.source_files = 'LTFunctional/Interface/Set/**/*'
      sss.dependency 'LTFunctional/Core'
    end

    ss.subspec 'Dictionary' do |sss|
      sss.source_files = 'LTFunctional/Interface/Dictionary/**/*'
      sss.dependency 'LTFunctional/Core'
    end
  end
end
