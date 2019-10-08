import UIKit

class ViewController: UIViewController {

    var users = [User]()
    
     lazy var tableView: UITableView = {
            let usersTableView = UITableView()
            usersTableView.dataSource = self
            usersTableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")
            
            return usersTableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

