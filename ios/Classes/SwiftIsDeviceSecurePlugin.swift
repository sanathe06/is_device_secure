import Flutter
import UIKit
import LocalAuthentication

public class SwiftIsDeviceSecurePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "is_device_secure", binaryMessenger: registrar.messenger())
    let instance = SwiftIsDeviceSecurePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "isSecure":
      result(devicePasscodeSet())
    default:
      result(FlutterMethodNotImplemented)
    }
    
  }

  private func devicePasscodeSet() -> Bool {
    return LAContext().canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
  }
}
