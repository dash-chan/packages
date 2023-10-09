import Flutter
import UIKit
import GooglePlaces

public class GmsPlacesApiPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      GmsPlacesApiSetup.setUp(binaryMessenger: registrar.messenger(), api: GmsPlacesApiImpl())
  }
}
