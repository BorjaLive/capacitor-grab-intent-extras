import Foundation
import Capacitor

@objc(GrabIntentExtrasPlugin)
public class GrabIntentExtrasPlugin: CAPPlugin {
    public static var launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    private let implementation = GrabIntentExtras()
    
    override public func load() {
        UNUserNotificationCenter.current().delegate = self.implementation
        self.implementation.plugin = self
        if let launchOptions = GrabIntentExtrasPlugin.launchOptions as? [String: Any] {
            if let launchExtras = launchOptions["UIApplicationLaunchOptionsRemoteNotificationKey"] as? [AnyHashable : Any] {
                self.implementation.emitExtras(extras: launchExtras)
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func getIntentExtras(_ call: CAPPluginCall) {
        let extras = implementation.getIntentExtras();
        if extras != nil {
            call.resolve(extras!);
        } else {
            call.resolve();
        }
    }
}
