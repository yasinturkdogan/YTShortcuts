Pod::Spec.new do |s|
  s.name             = 'YTShortcuts'
  s.version          = '0.1'
  s.summary          = 'Some handful shortcuts to make life easier'
  s.description      = <<-DESC
 YTShortcuts provides useful shortcuts to reduce redundant code and make it cleaner.
                       DESC
 
  s.homepage         = 'https://github.com/yasinturkdogan/YTShortcuts'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yasin Turkdogan' => 'yasinturkdogan@gmail.com' }
  s.source           = { :git => 'https://github.com/yasinturkdogan/YTShortcuts.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '8.0'
  s.source_files = 'YTShortcuts/**/*.{h,m,swift}' 
end