Pod::Spec.new do |spec|
  spec.name         = "ReSwiftSwiftUI"
  spec.version      = "1.0.0"
  spec.summary      = "SwiftUI bindings for ReSwift."
  spec.description  = <<-DESC
                      ReSwift-SwiftUI allows you to to subscribe to ReSwift state in SwiftUI views.
                      DESC

  spec.homepage     = "https://github.com/ReSwift/ReSwift-SwiftUI"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.authors      = "ReSwift"

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.14"
  spec.watchos.deployment_target = "5.0"
  spec.tvos.deployment_target = "13.0"

  spec.module_name  = "ReSwiftSwiftUI"
  spec.swift_versions = ["5.2", "5.0"]
  spec.source = {
    :git => "https://github.com/ReSwift/ReSwift-SwiftUI.git",
    :tag => spec.version.to_s }

  spec.source_files = "Sources"

  spec.dependency "ReSwift", "~> 6.0"
end
