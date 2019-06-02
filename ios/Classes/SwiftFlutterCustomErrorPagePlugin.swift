import Flutter
import UIKit

public class SwiftFlutterCustomErrorPagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_custom_error_page", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterCustomErrorPagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
