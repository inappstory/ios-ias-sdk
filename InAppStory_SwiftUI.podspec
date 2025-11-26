Pod::Spec.new do |s|

    s.name = 'InAppStory_SwiftUI'
    s.version = '1.26.0-SwiftUI'
    s.platform = :ios, '13.0'
    s.license  = { :type => 'MIT', :file => 'LICENSE' }
    s.homepage = 'https://github.com/inappstory/ios-ias-sdk'
    s.author = { "St.Pashik" => "stpashik@gmail.com" }
    s.source = { :git => 'https://github.com/inappstory/ios-ias-sdk.git', :tag => s.version }
    s.summary = 'Library for present Stories with customization'
    s.description = 'Library for present Stories with customization from inappstory.com' \
                    'You can customize every detail. Make Stories of your dream! :)'

    s.vendored_frameworks = "InAppStorySDK_SwiftUI.xcframework"
end
