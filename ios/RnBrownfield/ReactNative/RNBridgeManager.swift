import Foundation
import React

class RNBridgeManager: NSObject {
    var bridge: RCTBridge?

    override init() {
        super.init()
        if bridge == nil {
            bridge = RCTBridge.init(delegate: self, launchOptions: nil)
        }
    }
}

extension RNBridgeManager: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
//         #if CONFIGURATION_Debug
            return URL(string: "http://192.168.0.12:8081/index.bundle?platform=ios")
//         #else
//             return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
//         #endif
    }
}
