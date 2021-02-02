import Flutter
import UIKit

public class SwiftTeadsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "teads", binaryMessenger: registrar.messenger())
    let instance = SwiftTeadsPlugin()
    let factory = TeadsViewFactory(messenger: registrar.messenger())
    registrar.register(
                factory,
                withId: "TeadsPlatformView")

    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
