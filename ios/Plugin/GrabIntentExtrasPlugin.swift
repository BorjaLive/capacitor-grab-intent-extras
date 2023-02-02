import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(GrabIntentExtrasPlugin)
public class GrabIntentExtrasPlugin: CAPPlugin {
    private let implementation = GrabIntentExtras()

    @objc func getIntentExtras(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "extras": implementation.getIntentExtras()
        ])
    }
}
