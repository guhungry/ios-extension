#
#  Be sure to run `pod spec lint WCExtensions.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "WCExtensions"
  s.version      = "0.0.12"
  s.summary      = "Swift extension for Foundation and UIKit"
  s.description  = <<-DESC
  Swift extension for Foundation, UIKit with helpers and wrappers
                   DESC
  s.homepage     = "https://github.com/guhungry/ios-extension"
  s.license      = "MIT"
  s.author             = { "Woraphot Chokratanasombat" => "guhungry@gmail.com" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/guhungry/ios-extension.git", :tag => "#{s.version}" }
  s.source_files  = "WCExtensions/**/*.swift"
  s.swift_version = "4.2"
end
