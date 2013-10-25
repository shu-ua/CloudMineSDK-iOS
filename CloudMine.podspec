Pod::Spec.new do |s|
  s.name         = "CloudMine"
  s.version      = "1.5.10"
  s.summary      = "The iOS Framework for interacting with the CloudMine platform."
  s.homepage     = "https://cloudmine.me/docs/ios/reference"
  s.license      = 'MIT'
  s.author       = { "CloudMine" => "support@cloudmine.me" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/Wayfarer247/CloudMine-iOS-Testbed.git", :tag => "v1.5.10" }
  s.source_files  = 'ios/ios/src/**/*.{h,m}'
  s.exclude_files = 'math+floats.h', 'NSString+UUID.h', 'NSURL+QueryParameterAdditions.h', 'CMObject+Private.h', 'CMObjectClassNameRegistry.h'
  s.frameworks = 'UIKit', 'CoreGraphics', 'MobileCoreServices', 'SystemConfiguration', 'CFNetwork', 'Foundation', 'CoreFoundation', 'CoreLocation'
  s.libraries = 'z'
  s.requires_arc = true
  s.xcconfig = { 'OTHER_LDFLAGS' => '-all_load, -ObjC', 'FRAMEWORK_SEARCH_PATHS' => '"$(SRCROOT)/ios/Vendor"/**' }

  s.dependency 'AFNetworking', '~> 1.3.3'
  s.dependency 'MAObjCRuntime', '~> 0.0.1'

  s.post_install do |library_representation|
    prefix_header = library_representation.prefix_header_path
    prefix_header.open('a') do |file|
      file.puts('#ifdef __OBJC__\n#import <UIKit/UIKit.h>\n#import <SystemConfiguration/SystemConfiguration.h>\n#import <MobileCoreServices/MobileCoreServices.h>\n#endif')
    end
  end
end
