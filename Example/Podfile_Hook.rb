#hook installer
class Pod::Installer

    def create_pod_installer_hbc(pod_name)
      
      if ((pod_name <=> 'libwebp') == 0)
          libwebp_pod_target = nil
          pod_targets.each do |pod_target|
            if ((pod_target.root_spec.name <=> 'libwebp') == 0)
                libwebp_pod_target = pod_target
                customSource = { :git => 'https://github.com/webmproject/libwebp.git', :tag => 'v1.0.3' }
                libwebp_pod_target.root_spec.source = customSource
            end
          end
      end
      create_pod_installer_Orig(pod_name)
    end

    alias_method :create_pod_installer_Orig, :create_pod_installer
    alias_method :create_pod_installer, :create_pod_installer_hbc

end
