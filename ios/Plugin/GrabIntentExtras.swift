import Foundation
import Capacitor

@objc public class GrabIntentExtras: NSObject, UNUserNotificationCenterDelegate {
    public weak var plugin: CAPPlugin?
    private var storedExtra: [String : Any]? = nil
    
    @objc public func getIntentExtras() -> [String : Any]? {
        let extras = self.storedExtra
        self.storedExtra = nil
        return extras;
    }
    
    @objc public func emitExtras(extras: [AnyHashable : Any]) {
        guard let pExtras = extras as NSDictionary? as? [String: Any] else { return }
        if self.plugin?.hasListeners("intentExtras") == true {
            self.plugin?.notifyListeners("intentExtras", data: pExtras)
        } else {
            self.storedExtra = pExtras
        }
    }
    
    //Mostrar la notificacion tal cual
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }

    //Avisar del click en la notificacion
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.emitExtras(extras: response.notification.request.content.userInfo)
        completionHandler()
    }
}
