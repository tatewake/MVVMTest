platform :macos, '12.3'

def shared_pods
    pod 'Periphery', '~> 2.9.0'
	pod 'SwiftFormat/CLI', '~> 0.49.18'
    pod 'SwiftGen', '~> 6.6.2'
    pod 'SwiftLint', '~> 0.49.1'
end

target 'MVVMTest' do
    pod 'IBLinter', '~> 0.5.0'
    shared_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'ARCHS'
      config.build_settings['DEAD_CODE_STRIPPING'] = 'YES'
      if ['IBLinter', 'Periphery', 'SwiftGen'].include? target.name
        config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '12.3'
      end
    end
  end
end
