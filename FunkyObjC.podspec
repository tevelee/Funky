Pod::Spec.new do |s|
  s.name             = 'FunkyObjC'
  s.version          = '1.2.1'
  s.summary          = 'Funky is a collection utility with functional extensions.'

  s.description      = <<-DESC
Funky is a utility helper library to help dealing with common array, set and dictionary operations easier. It provides a set of extensions, functional helpers, and even data types to help dealing with nil values in collections. All operations are well unit-tested, so you can rely on the helpers and structures in production code as well.
DESC

  s.homepage         = 'https://github.com/tevelee/Funky'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Laszlo Teveli' => 'tevelee@gmail.com' }
  s.source           = { :git => 'https://github.com/tevelee/Funky.git', :tag => s.version.to_s }

  s.header_dir = 'Funky'
  s.module_name = 'Funky'

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Source/Core/**/*'
    ss.public_header_files = 'Source/Core/Public/*.h', 'Source/Core/Public/**/*.h'
    ss.private_header_files = 'Source/Core/Private/*.h', 'Source/Core/Private/**/*.h'
  end

  s.subspec 'Collections' do |ss|
    ss.dependency 'FunkyObjC/Core'

    ss.subspec 'Array' do |sss|
      sss.source_files = 'Source/Collections/Array/**/*', 'Source/Collections/Common/**/*'
      sss.public_header_files = 'Source/Collections/Array/*.h', 'Source/Collections/Array/**/*.h'
    end

    ss.subspec 'Set' do |sss|
      sss.source_files = 'Source/Collections/Set/**/*', 'Source/Collections/Common/**/*'
      sss.public_header_files = 'Source/Collections/Set/*.h', 'Source/Collections/Set/**/*.h'
    end

    ss.subspec 'Dictionary' do |sss|
      sss.source_files = 'Source/Collections/Dictionary/**/*', 'Source/Collections/Common/**/*'
      sss.public_header_files = 'Source/Collections/Dictionary/*.h', 'Source/Collections/Dictionary/**/*.h'
    end
  end

  s.subspec 'Interface' do |ss|
    ss.dependency 'FunkyObjC/Core'

    ss.subspec 'Object' do |sss|
      sss.source_files = 'Source/Interface/Object/**/*'
    end

    ss.subspec 'Array' do |sss|
      sss.source_files = 'Source/Interface/Array/**/*'
    end

    ss.subspec 'Set' do |sss|
      sss.source_files = 'Source/Interface/Set/**/*'
    end

    ss.subspec 'Dictionary' do |sss|
      sss.source_files = 'Source/Interface/Dictionary/**/*'
    end
  end

  s.subspec 'PrefixedInterface' do |ss|
    ss.dependency 'FunkyObjC/Core'

    ss.subspec 'Object' do |sss|
      sss.source_files = 'Source/PrefixedInterface/Object/**/*'
    end

    ss.subspec 'Array' do |sss|
      sss.source_files = 'Source/PrefixedInterface/Array/**/*'
    end

    ss.subspec 'Set' do |sss|
      sss.source_files = 'Source/PrefixedInterface/Set/**/*'
    end

    ss.subspec 'Dictionary' do |sss|
      sss.source_files = 'Source/PrefixedInterface/Dictionary/**/*'
    end
  end
end
