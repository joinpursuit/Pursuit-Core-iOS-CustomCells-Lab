import UIKit

class ViewController: UIViewController {

    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
     lazy var tableView: UITableView = {
            let usersTableView = UITableView()
            usersTableView.dataSource = self
            usersTableView.register(UserTableViewCell.self, forCellReuseIdentifier: "userCell")
            
            return usersTableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        setConstraints()
        loadData()
    }
    
    private func loadData() {
        UsersFetchingService.manager.getUsers { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let usersFromJSON):
                    self.users = usersFromJSON
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func setConstraints() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = users[indexPath.row]
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else {return UITableViewCell()}
        
        cell.nameLabel.text = user.name.first
        
        return cell
    }
    
    
}

