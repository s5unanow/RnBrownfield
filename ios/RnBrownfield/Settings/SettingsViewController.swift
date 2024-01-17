import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        view.backgroundColor = .white
        setupTableView()
    }

    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Personal Information"
        case 1:
            cell.textLabel?.text = "Appearance"
        case 2:
            cell.textLabel?.text = "Accessibility"
        default:
            break
        }
        return cell
    }

    // MARK: - Table View Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let viewController: UIViewController
        switch indexPath.row {
        case 0:
            viewController = PersonalInformationViewController()
        case 1:
            viewController = AppearanceViewController()
        case 2:
            viewController = AccessibilityViewController()
        default:
            return
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
}
