import React
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let bridge = RCTBridge(delegate: self, launchOptions: launchOptions)
        let rootView = RCTRootView(bridge: bridge, moduleName: "AwesomeApp", initialProperties: nil)
        rootView?.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        let rootViewController = UIViewController()
        rootViewController.view = rootView
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate: RCTBridgeDelegate {
    func sourceURL(for _: RCTBridge!) -> URL! {
        return RCTBundleURLProvider.sharedSettings()?.jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
        // return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
    }
}
