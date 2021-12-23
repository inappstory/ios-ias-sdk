Pod::Spec.new do |s|

    s.name = 'InAppStory_SwiftUI'
    s.version = '1.12.0'
    s.platform = :ios, '13.0'
    s.license  = { :type => 'MIT', :file => 'LICENSE' }
    s.homepage = 'https://github.com/inappstory/ios-sdk'
    s.author = { "St.Pashik" => "stpashik@gmail.com" }
    s.source = { :git => 'https://github.com/inappstory/ios-sdk.git', :tag => s.version }
    s.summary = 'Библиотека для представления Stories с возможностью кастомизации.'
    s.description = 'Библиотека для представления Stories с возможностью кастомизации предоставляемая для работы с сайтом casestory.io' \
                    'You can customize every detail. Make Stories of your dream! :)'

    s.vendored_frameworks = "InAppStorySDK_SwiftUI.xcframework"
end
