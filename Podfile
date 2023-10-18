platform :ios, '11.0'

target 'Proyecto_Joseba_PNP' do
  
  use_frameworks!

  pod 'PKHUD'

  target 'Proyecto_Joseba_PNPTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'Proyecto_Joseba_PNPUITests' do
    # Pods for testing
  end

end

  post_install do |installer|
    installer.generated_projects.each do |project|
      project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
           end
      end
   end
end

