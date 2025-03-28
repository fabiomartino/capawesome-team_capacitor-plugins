import Foundation
import UIKit

@objc public class AppShortcuts: NSObject {
    let config: AppShortcutsConfig

    public init(_ config: AppShortcutsConfig) {
        self.config = config
        super.init()
        if let configShortcuts = self.config.shortcuts {
            self.set(shortcuts: configShortcuts, completion: { _ in })
        }
    }

    @objc public func get(completion: @escaping (Result) -> Void) {
        let application = UIApplication.shared

        DispatchQueue.main.async {
            let result = GetResult(shortcutItems: application.shortcutItems)
            completion(result)
        }
    }

    @objc public func set(shortcuts: [UIApplicationShortcutItem], completion: @escaping (Error?) -> Void) {
        let application = UIApplication.shared

        DispatchQueue.main.async {
            application.shortcutItems = shortcuts
            completion(nil)
        }
    }

    @objc public func clear(completion: @escaping (Error?) -> Void) {
        let application = UIApplication.shared

        DispatchQueue.main.async {
            application.shortcutItems = []
            completion(nil)
        }
    }
}
