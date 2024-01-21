import React
import Foundation

class RNBaseViewController: UIViewController {
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
    let bridgeManager = RNBridgeManager()
    guard let bridge = bridgeManager.bridge else {return}
    
    view = RCTRootView(
      bridge: bridge,
      moduleName: "RnBrownfield",
      initialProperties: getInitialProperties()
    )
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }

  
  private func getInitialProperties() -> [String: Any] {
    return [:]
  }
}
