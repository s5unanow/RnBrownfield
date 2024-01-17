import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)

        let settingsViewController = SettingsViewController()
        let settingsNavController = UINavigationController(rootViewController: settingsViewController)
        settingsNavController.tabBarItem = UITabBarItem(title: "Settings", image: nil, selectedImage: nil)

        viewControllers = [homeViewController, settingsNavController]

        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }
}
