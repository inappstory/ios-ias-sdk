Pod::Spec.new do |s|

    s.name = 'InAppStory'
    s.version = '1.5.2'
    s.platform = :ios, '10.0'
    s.license  = { :type => 'MIT', :file => 'LICENSE' }
    s.homepage = 'https://github.com/inappstory/ios-sdk'
    s.author = { "St.Pashik" => "stpashik@gmail.com" }
    s.source = { :git => 'https://github.com/inappstory/ios-sdk.git', :tag => s.version }
    s.summary = 'Библиотека для представления Stories с возможностью кастомизации.'
    s.description = 'Библиотека для представления Stories с возможностью кастомизации предоставляемая для работы с сайтом casestory.io' \
                    'You can customize every detail. Make Stories of your dream! :)'

    s.vendored_frameworks = "InAppStorySDK.xcframework"
end
