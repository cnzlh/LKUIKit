
Pod::Spec.new do |s|
    s.name                = 'LKUIKit'
    s.version             = '1.0.2'
    s.summary             = 'A Swift extension that adds toast notifications to the UIView object class.'
    s.homepage            = 'https://github.com/cnzlh/LKUIKit'
    s.license             = { :type => 'MIT', :file => 'LICENSE' }
    s.author              = { 'zhulinhua' => '20825520@qq.com' }
    s.source              = { :git => 'https://github.com/cnzlh/LKUIKit.git', :tag => s.version.to_s }
    s.source_files        = 'LKUIKit/Classes/**/*'
    s.frameworks          = 'UIKit', 'QuartzCore'
    s.platform            = :ios
    s.ios.deployment_target = '8.0'
    s.dependency 'MBProgressHUD'
end
