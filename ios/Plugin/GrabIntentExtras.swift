import Foundation

@objc public class GrabIntentExtras: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
