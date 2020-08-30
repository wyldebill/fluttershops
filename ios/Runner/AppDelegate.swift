import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //let settings = ConfigurationManager().load(.environmentVariables)
    //let apiKey = settings["googlemapsapikeyios"] as? String
    GeneratedPluginRegistrant.register(with: self)
  GMSServices.provideAPIKey(Bundle.main.object(forInfoDictionaryKey: "MAPS_API_KEY") as? String ?? "")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
