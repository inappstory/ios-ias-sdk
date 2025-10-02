Pod::Spec.new do |s|

    s.name = 'InAppStory'
    s.version = '1.26.0-RC7'
    s.platform = :ios, '11.0'
    s.license  = { :type => 'MIT', :file => 'LICENSE' }
    s.homepage = 'https://github.com/inappstory/ios-ias-sdk'
    s.author = { "St.Pashik" => "stpashik@gmail.com" }
    s.source = { :git => 'https://github.com/inappstory/ios-ias-sdk.git', :tag => s.version }
    s.summary = 'A library for presenting Stories with customization options.'
    s.description = 'A customizable library for presenting Stories provided to work with inappstory.com' \
                    'You can customize every detail. Make Stories of your dream! :)'

    s.vendored_frameworks = "InAppStorySDK.xcframework"
end
